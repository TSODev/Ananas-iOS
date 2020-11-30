//
//  AnanasSidebarView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct AnanasSidebarView: View {
    
//    @ObservedObject var data = DataController.shared
    var datafiles: [Datafile]
    var metadata: [Metadata]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PeopleListView(), label: {
                    Label("Collaborateurs", systemImage: "person.3")
                })
                NavigationLink(destination: DonneesView(donnees: datafiles, metadata: metadata), label: {
                    Label("Données", systemImage: "folder.fill")
                })
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("ANANAS")
            
            PeopleListView()
            
            PeopleDetailsView(people: demoPeople, anomalies: [])

        }
        .id("SideBar")
        .onAppear(perform: {
            debugPrint("Appear : AnanasSideTabView")
        })
        .onDisappear(perform: {
            debugPrint("Disappear : AnanasSideTabView")
        })
    }
}

struct AnanasSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        AnanasSidebarView( datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2])
        AnanasSidebarView( datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2])
            .preferredColorScheme(.dark)
    }
}
