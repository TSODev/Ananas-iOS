//
//  PeopleListView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct PeopleListView: View {
    
    var peoples: [People]
//    var anomalies: [Anomalie]
    var noEventsText: String
    var isDiscover = false

    @ObservedObject var viewModel = DataController.shared
    
    var body: some View {
        HStack(spacing: 8) {
            TextField("Filtre par nom...", text: $viewModel.searchPeople)
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
        }
        .padding(.top, 10)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        ScrollView {
            VStack {
                if peoples.count == 0 {
                    Text(noEventsText)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                        .padding(.horizontal, 20)
                } else {
                    ForEach(viewModel.filteredPeople) { people in
                        let anomalies = DataController.shared.anomalies.filter({$0.people_id == people.people_id})
                        let hasAnomalies = (anomalies.count > 0)
                        if (hasAnomalies) {
                            NavigationLink(
                                destination: PeopleDetailsView(people: people, anomalies: anomalies ),
                                label: {PeopleTileView(people: people, anomalies: anomalies)}

                            )
                            .buttonStyle(PlainButtonStyle())
                        } else {
                            NavigationLink(
                                destination: PeopleDetailsView(people: people, anomalies: anomalies ),
                                label: {PeopleTileView(people: people, anomalies: anomalies)
                                    }

                            )
                            .buttonStyle(PlainButtonStyle())
                            
                        }

                    }
                }
            }
        }
        .frame(minWidth:250)
        .navigationTitle("Collaborateurs")
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PeopleListView(peoples: [samplePeople1,samplePeople1], noEventsText: "Nothing here :(")
            
            PeopleListView(peoples: [], noEventsText: "Nothing here :(")
        }
    }
}
