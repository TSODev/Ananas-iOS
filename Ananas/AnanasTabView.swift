//
//  AnanasTabView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct AnanasTabView: View {

//        @ObservedObject var data = DataController.shared
        var datafiles: [Datafile]
        var metadata: [Metadata]
        
        var body: some View {
            VStack {
                NavigationView {
                    List {
                        NavigationLink(destination: PeopleListViewCompact(), label: {
                            Label("Collaborateurs", systemImage: "person.3")
                        })
                        NavigationLink(destination: DonneesView(donnees: datafiles, metadata: metadata), label: {
                            Label("Données", systemImage: "folder.fill")
                        })

                    }
                    .listStyle(SidebarListStyle())
                    .navigationTitle("ANANAS")
                    
                    PeopleListViewCompact()

                    PeopleDetailsView(people: demoPeople, anomalies: [])

            }
            }

        }
    }


struct AnanasTabView_Previews: PreviewProvider {
    static var previews: some View {
        AnanasTabView( datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .previewDevice("iPhone X")
        AnanasTabView( datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .preferredColorScheme(.dark)
            .previewDevice("iPhone X")
    }
}
