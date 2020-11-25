//
//  AnanasSidebarView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct AnanasSidebarView: View {
    
//    @ObservedObject var data = DataController.shared
    var peoples: [People]
    var datafiles: [Datafile]
    var metadata: [Metadata]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PeopleListView(peoples: peoples, noEventsText: "En attente")){
                    Label("Collaborateurs", systemImage: "person.3")
                }
                NavigationLink(destination: DonneesView(donnees: datafiles, metadata: metadata)) {
                    Label("Données", systemImage: "folder.fill")
                }

        }
            .listStyle(SidebarListStyle())
            .navigationTitle("ANANAS")
            
            PeopleListView(peoples: peoples, noEventsText: "En attente")
            
            PeopleDetailsView(people: demoPeople, anomalies: [])

        }
    }
}

struct AnanasSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        AnanasSidebarView(peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2])
        AnanasSidebarView(peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2])
            .preferredColorScheme(.dark)
    }
}
