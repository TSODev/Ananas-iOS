//
//  DataControler.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import Foundation
import Alamofire
import Combine


class DataController: ObservableObject {
    static var shared = DataController()
    
    let endpoint = "https://aws.tsodev.fr/api/v1"

    struct PeopleList: Codable {
            let people: [People]
    }
    struct MetadataList: Codable {
            let metadata: [Metadata]
    }
    struct DatafileList: Codable {
            let datafiles: [Datafile]
    }
    
    @Published var appIsLoading = true
    @Published var loggedUser: User = User()
    @Published  var peoples: [People] = []
    @Published var anomalies: [Anomalie] = []
    @Published var metadata: [Metadata] = []
    @Published var datafiles: [Datafile] = []
    @Published var searchPeople = ""
    
    @Published var logged = false
    var peopleLoaded = false
    var anomalieLoaded = false
    var anomalieUpdated = false
    var metadataLoaded = false
    var datafilesLoaded = false

    @Published var filteredPeople: [People] = []
    var publisher: AnyCancellable?
    
    
    init() {
        self.publisher = $searchPeople
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .receive(on: RunLoop .main)
            .sink(receiveValue: { (str) in
//                debugPrint(str)
                if !self.searchPeople.isEmpty {
                    self.filteredPeople = self.peoples.filter { $0.fullname.contains(str) }
                } else {
                    self.filteredPeople = self.peoples
                }
//                self.filteredPeople.map {debugPrint ($0.fullname)}
            })
        
        
    }
    
    func isAppLoading() {
        self.appIsLoading = !(self.logged && self.peopleLoaded && self.anomalieLoaded)
    }
    
    func sendAdminLoginRequest() {
        DispatchQueue.global().async {
        /**
         ADMIN Login
         post https://aws.tsodev.fr:443/api/v1/login
         */

        
        // Add Headers
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

        // JSON Body
        let body: [String : Any] = [
            "email": "thierry.soulie@tsodev.fr",
            "password": "12345678"
        ]

        
        
        // Fetch Request
            AF.request(self.endpoint + "/login", method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
                .responseDecodable(of: User.self) { response in
                    switch response.result {
                    case .success: do {
                    DispatchQueue.main.async {                          //return back to main thread
                        self.loggedUser = response.value!
                        self.logged = true
                        self.isAppLoading()
                        debugPrint("Logged...")
                    }
                    }
                    case .failure(let error):
                        debugPrint(response)
                        debugPrint("Erreur de requete : \(error)")
            }
    }
    }
    }

    
    
    func sendGetAllPeopleRequest() {
        DispatchQueue.global().async {
        /**
         Get All People
         get https://aws.tsodev.fr:443/api/v1/allpeople
         */
        var sessionCookie = ""

        if let cookies = HTTPCookieStorage.shared.cookies {
            sessionCookie = cookies.filter({$0.name == "SESSIONID"}).first?.value ?? ""
        }
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Cookie":" SESSIONID=" + sessionCookie,
        ]

        // Fetch Request
            AF.request(self.endpoint + "/allLNpeople", method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: PeopleList.self) {  response in
                switch response.result {
                case .success: do {
                DispatchQueue.main.async {
                    self.peoples = response.value!.people.filter({$0.source == 1})
                    self.filteredPeople = response.value!.people
                    self.peopleLoaded = true
                    self.isAppLoading()
                    debugPrint("Peoples loaded...")
                }
                }
                case .failure(let error):
                    debugPrint(response)
                    debugPrint("Erreur de requete : \(error)")
            }
    }
    }
    }

    
    func sendGetAllAnomaliesFromViewRequest() {
        /**
         Get ALL from view
         get https://aws.tsodev.fr:443/api/v1/allanomaliesfromview
         */

        // Add Headers
        var sessionCookie = ""

        if let cookies = HTTPCookieStorage.shared.cookies {
            sessionCookie = cookies.filter({$0.name == "SESSIONID"}).first?.value ?? ""
        }
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Cookie":" SESSIONID=" + sessionCookie,
        ]
        // Fetch Request
        AF.request(self.endpoint + "/allanomaliesfromview", method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Anomalie].self) {  response in
                switch response.result {
                case .success: do {
                DispatchQueue.main.async {
                    self.anomalies = response.value!
                    self.anomalieLoaded = true
                    self.isAppLoading()
                    debugPrint("Anomalies loaded...")
                }
                }
                case .failure(let error):
                    debugPrint(response)
                    debugPrint("Erreur de requete : \(error)")
                }
            }
    }

    func sendUpdateAnomalieRequest(id: Int, etat: Int, commentaire: String) {
        /**
         Update Anomalie
         put https://aws.tsodev.fr:443/api/v1/updateanomaliewithetatandcomment
         */
        
        var sessionCookie = ""

        if let cookies = HTTPCookieStorage.shared.cookies {
            sessionCookie = cookies.filter({$0.name == "SESSIONID"}).first?.value ?? ""
        }
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Cookie":" SESSIONID=" + sessionCookie,
        ]

        // JSON Body
        let body: [String : Any] = [
            "commentaire": commentaire,
            "anomalie_id": id,
            "etat": etat
        ]

        debugPrint("id: \(id) , etat: \(etat) , commentaire: \(commentaire)")
        // Fetch Request
        AF.request(self.endpoint + "/updateanomaliewithetatandcomment", method: .put, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .response {  response in
                DispatchQueue.main.async {
                    self.anomalieUpdated = true
                    debugPrint("Anomalie updated...")
                }
            }
        
    }
    
    func sendGetMetadataRequest() {
        /**
         Get Metadata
         get https://aws.tsodev.fr:443/api/v1/metadata
         */

        
        var sessionCookie = ""

        if let cookies = HTTPCookieStorage.shared.cookies {
            sessionCookie = cookies.filter({$0.name == "SESSIONID"}).first?.value ?? ""
        }
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Cookie":" SESSIONID=" + sessionCookie,
        ]


        // Fetch Request
        AF.request(self.endpoint + "/metadata", method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: MetadataList.self) { response in
                switch response.result {
                case .success: do {
                    DispatchQueue.main.async {
                        self.metadataLoaded = true
                        self.metadata = response.value!.metadata
//                        debugPrint(self.metadata)
                        debugPrint("Metadata loaded...")
                    }

                }
                case .failure(let error):
                    debugPrint(response)
                    debugPrint("Erreur de requete : \(error)")
                }
            }
    }
    

    func sendGetDatafilesRequest() {
        /**
         Get Metadata
         get https://aws.tsodev.fr:443/api/v1/metadata
         */

        
        var sessionCookie = ""

        if let cookies = HTTPCookieStorage.shared.cookies {
            sessionCookie = cookies.filter({$0.name == "SESSIONID"}).first?.value ?? ""
        }
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Cookie":" SESSIONID=" + sessionCookie,
        ]


        // Fetch Request
        AF.request(self.endpoint + "/datafiles", method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: DatafileList.self) { response in
                switch response.result {
                case .success: do {
                    DispatchQueue.main.async {
                        self.datafilesLoaded = true
                        self.datafiles = response.value!.datafiles
//                        debugPrint(self.datafiles)
                        debugPrint("Datafiles loaded...")
                    }

                }
                case .failure(let error):
                    debugPrint("Erreur de requete : \(error)")
                }
            }
    }

}
