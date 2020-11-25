//
//  AnanasTabView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct AnanasTabView: View {

//        @ObservedObject var data = DataController.shared
        var peoples: [People]
        var datafiles: [Datafile]
        var metadata: [Metadata]
        
        var body: some View {
            NavigationView {
                List {
                    NavigationLink(destination: PeopleListViewCompact(peoples: peoples, noEventsText: "En attente")){
                        Label("Collaborateurs", systemImage: "person.3")
                    }
                    NavigationLink(destination: DonneesView(donnees: datafiles, metadata: metadata)) {
                        Label("Données", systemImage: "folder.fill")
                    }

            }
                .listStyle(SidebarListStyle())
                .navigationTitle("ANANAS")
                
                PeopleListViewCompact(peoples: peoples, noEventsText: "En attente")
                
                PeopleDetailsView(people: demoPeople, anomalies: [])

        }
        }
    }


struct AnanasTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnanasTabView(peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .previewDevice("iPhone X")
        AnanasTabView(peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .preferredColorScheme(.dark)
            .previewDevice("iPhone X")
    }
}
