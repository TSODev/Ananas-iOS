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
    
    var endpoint = ""

    struct PeopleList: Codable {
            let people: [People]
    }
    struct MetadataList: Codable {
            let metadata: [Metadata]
    }
    struct DatafileList: Codable {
            let datafiles: [Datafile]
    }
    @Published var APIResult = false
    
    @Published var appIsLoading = true
    @Published var logged = false
    @Published var loggedUser: User = User()
    
    @Published var peopleLoaded = false
    @Published var anomalieLoaded = false
    
    var peoples: [People] = []
//    var filteredPeople: [People] = []
    var anomalies: [Anomalie] = []
//    @Published var filteredAnomalies: [Anomalie] = []
    var metadata: [Metadata] = []
    var datafiles: [Datafile] = []
    


    var anomalieUpdated = false
    var metadataLoaded = false
    var datafilesLoaded = false
    
    var isPeopleBuilt = false
    @Published var builtPeoples: PeopleContainer = PeopleContainer(peoples: [])
    
    var mySettings: UserDefaults = UserDefaults.standard
    var settingURL = ""
    var settingLogin = ""
    var settingPassword = ""
    

    init() {
        debugPrint("DataControler init...")
        debugPrint("Settings : \(mySettings.dictionaryRepresentation())")
        debugPrint("Settings : \(mySettings.object(forKey: "server") ?? "")")
        debugPrint("Settings : \(mySettings.object(forKey: "login") ?? "")")
        debugPrint("Settings : \(mySettings.object(forKey: "password") ?? "")")
        self.settingURL = "https://" + String(describing: mySettings.object(forKey: "server") ?? "")
        self.settingLogin = String(describing: mySettings.object(forKey: "login") ?? "")
        self.settingPassword = String(describing: mySettings.object(forKey: "password") ?? "")
        self.endpoint = self.settingURL + "/api/v1"
        debugPrint(self.endpoint)
    }
    
    func isAppLoading() {
//        self.appIsLoading = !(self.logged && self.peopleLoaded && self.anomalieLoaded && self.metadataLoaded && self.datafilesLoaded)
        self.appIsLoading = !(self.logged)

    }
    
    func setBuiltPeoples( container: PeopleContainer) {
        self.builtPeoples = container
    }
    
    func buildPeopleRef() {
        if (!self.isPeopleBuilt && self.peopleLoaded && self.anomalieLoaded) {
                self.builtPeoples = PeopleContainer(peoples: self.peoples)
                self.isPeopleBuilt = true
                debugPrint("Peoples built...")
        }
    }
    
    func sendAdminLoginRequest() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
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
            "email": self.settingLogin,
            "password": self.settingPassword
        ]

        
        
        // Fetch Request
            AF.request(self.endpoint + "/login", method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
                .responseDecodable(of: User.self) { response in
                    switch response.result {
                        case .success: do {
                            DispatchQueue.main.async {          //return back to main thread
                                self.loggedUser = response.value!
                                self.APIResult = true
                                self.logged = true
                                self.isAppLoading()
                                debugPrint("Logged...")
                            }
                        }
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self.APIResult = false
                            self.logged = false
                            debugPrint(response)
                            debugPrint("Erreur de requete : \(error)")
                            }
                    }
                }
        }
    }

    
    func testGetAllPeopleRequest() {
        
        /**
         Get All People
         get https://aws.tsodev.fr:443/api/v1/allpeople
         */
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
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
            .responseJSON {  response in
                switch response.result {
                    case .success(let JSON): do {
                        DispatchQueue.main.async {
                            let response = JSON as! NSDictionary
                            debugPrint("Success with JSON: \(response)")
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
        
        /**
         Get All People
         get https://aws.tsodev.fr:443/api/v1/allpeople
         */
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
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
                            self.peoples = response.value!.people
                            self.peopleLoaded = true
                            self.isAppLoading()
                            debugPrint("Peoples loaded...")
                            self.buildPeopleRef()
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

        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
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
                    self.buildPeopleRef()
                }
                }
                case .failure(let error):
                    debugPrint(response)
                    debugPrint("Erreur de requete : \(error)")
                }
            }
        }
    }

    func sendUpdateAnomalieRequest(id: Int, etat: Int, commentaire: String) {
        /**
         Update Anomalie
         put https://aws.tsodev.fr:443/api/v1/updateanomaliewithetatandcomment
         */
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
        
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
            
            let anomalie_index = self.anomalies.firstIndex(where: {$0.anomalie_id == id})
            let anomalie = self.anomalies[anomalie_index!]
            let people_index = self.peoples.firstIndex(where: {$0.people_id == anomalie.people_id})
            let people = self.peoples[people_index!]

        debugPrint("id: \(id) , etat: \(etat) , commentaire: \(commentaire)")
        // Fetch Request
        AF.request(self.endpoint + "/updateanomaliewithetatandcomment", method: .put, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .response {  response in
                DispatchQueue.main.async {
                    self.anomalieUpdated = true

                    if let index = self.anomalies.firstIndex(where: {$0.anomalie_id == id}) {
                        self.anomalies[index].commentaire = commentaire
                        self.anomalies[index].etat = etat
                        debugPrint("Anomalie updated... : \(self.anomalies[index].anomalie_id)")
                    }
                    
                    let containerIndex = self.builtPeoples.anomaliesForPeople.firstIndex( where: {$0.people_id == people.people_id})
                    let container = self.builtPeoples.anomaliesForPeople[containerIndex!].anomalies
                    if let index = container.content.firstIndex(where: {$0.anomalie_id == id}) {
                        container.content[index].commentaire = commentaire
                        container.content[index].etat = etat
                        container.fullState = container.content.map({$0.etat}).reduce(0, +)
                        container.testIfCleared()
                        self.builtPeoples.anomaliesForPeople[containerIndex!].anomalies = container
                        debugPrint("Anomalie Container updated... : \(self.builtPeoples.anomaliesForPeople[containerIndex!].anomalies)")
                        }
                    

                }
            }
        }
        
    }
    
    func sendGetMetadataRequest() {
        /**
         Get Metadata
         get https://aws.tsodev.fr:443/api/v1/metadata
         */

        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
        
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
                        self.isAppLoading()
                        debugPrint("Metadata loaded...")
                    }

                }
                case .failure(let error):
                    debugPrint(response)
                    debugPrint("Erreur de requete : \(error)")
                }
            }
        }
    }
    

    func sendGetDatafilesRequest() {
        /**
         Get Metadata
         get https://aws.tsodev.fr:443/api/v1/metadata
         */

        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
        
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
                        self.isAppLoading()
                        debugPrint("Datafiles loaded...")
                    }

                }
                case .failure(let error):
                    debugPrint("Erreur de requete : \(error)")
                }
            }
        }
    }

}
