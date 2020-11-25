//
//  MainView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    //@ObservedObject var data = DataController.shared
    var isLoading: Bool
    var peoples: [People]
    var datafiles: [Datafile]
    var metadata: [Metadata]
    
    var body: some View {
        if isLoading {
            LoadingScreen()
        } else {
            if horizontalSizeClass == .compact {
                AnanasTabView(peoples: peoples, datafiles: datafiles, metadata: metadata)
            } else {
                AnanasSidebarView(peoples: peoples, datafiles: datafiles, metadata: metadata)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(isLoading: true, peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .previewDevice("iPad (8th generation)")
        MainView(isLoading: true, peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .previewDevice("iPhone X")
        MainView(isLoading: false, peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .previewDevice("iPad (8th generation)")
            .preferredColorScheme(.light)
        MainView(isLoading: false, peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .previewDevice("iPhone X")
            .preferredColorScheme(.light)
        MainView(isLoading: false, peoples: [samplePeople1, samplePeople2], datafiles: [sampleDatafile1], metadata: [sampleMetada1, sampleMetada2, sampleMetada3])
            .preferredColorScheme(.dark)
            
    }
}
