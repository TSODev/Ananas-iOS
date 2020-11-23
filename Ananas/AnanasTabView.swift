//
//  AnanasTabView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct AnanasTabView: View {

        @ObservedObject var data = DataController.shared
        
        var body: some View {
            NavigationView {
                List {
                    NavigationLink(destination: PeopleListView(peoples: data.peoples, noEventsText: "En attente")){
                        Label("Collaborateurs", systemImage: "person.3")
                    }
                    NavigationLink(destination: DonneesView(donnees: data.datafiles, metadata: data.metadata)) {
                        Label("Données", systemImage: "folder.fill")
                    }

            }
                .listStyle(SidebarListStyle())
                .navigationTitle("ANANAS")
                
                PeopleListView(peoples: data.peoples, noEventsText: "En attente")
                
                PeopleDetailsView(people: demoPeople, anomalies: [])

        }
        }
    }


struct AnanasTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnanasTabView()
    }
}
