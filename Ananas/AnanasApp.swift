//
//  AnanasApp.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

@main
struct AnanasApp: App {

    @ObservedObject var data = DataController.shared
//    @State var peoples: [People]
//    @State var anomalies: [Anomalie]
//    @State var datafiles: [Datafile]
//    @State var metadata: [Metadata]
    
    @State var isPeopleBuilt = false
    @State var builtPeoples: PeopleContainer = PeopleContainer(peoples: [])
    
    func buildPeopleRef() {

        if (!isPeopleBuilt) {
            self.builtPeoples = PeopleContainer(peoples: data.peoples)
            self.builtPeoples.anomaliesForPeople.map({debugPrint("\($0.fullname) : \($0.hasAnomalies) -> \($0.anomalies.count)")})
            data.setBuiltPeoples(container: self.builtPeoples)
            self.isPeopleBuilt = true
            debugPrint("Peoples built...")
        }

    }

    var body: some Scene {
        WindowGroup {
            MainView(isLoading: data.appIsLoading, datafiles: data.datafiles, metadata: data.metadata)
                .onAppear {
                    DataController.shared.sendAdminLoginRequest()
                }
                .onReceive(data.$logged, perform: { userLogged in

                        if (userLogged) {
                            DataController.shared.sendGetAllPeopleRequest()
                            DataController.shared.sendGetAllAnomaliesFromViewRequest()
                            DataController.shared.sendGetMetadataRequest()
                            DataController.shared.sendGetDatafilesRequest()
                        }

                })
//                .onReceive(data.$peopleLoaded, perform: { _ in
//                    if (data.anomalieLoaded) {
//                        self.buildPeopleRef()
//                    }
//                })
//                .onReceive(data.$anomalieLoaded, perform: { _ in
//                    if (data.peopleLoaded) {
//                        self.buildPeopleRef()
//                    }
//                })
        }
    }
    

}
