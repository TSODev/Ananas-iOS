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

    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    DataController.shared.sendAdminLoginRequest()
                }
                .onReceive(data.$logged, perform: { userLogged in
                    debugPrint("logged ? \(userLogged)")
                    if (userLogged) {
                        DataController.shared.sendGetAllPeopleRequest()
                        DataController.shared.sendGetAllAnomaliesFromViewRequest()
                        DataController.shared.sendGetMetadataRequest()
                        DataController.shared.sendGetDatafilesRequest()
                    }
                })
        }
    }
}
