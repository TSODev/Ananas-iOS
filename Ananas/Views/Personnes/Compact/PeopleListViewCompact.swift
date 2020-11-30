//
//  PeopleListViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI



struct PeopleListViewCompact: View {

        var noEventsText: String = "En attente ..."

        @ObservedObject var data = DataController.shared
        @ObservedObject var engine: TextEngine = TextEngine()
    
    var body: some View {

        VStack {
            FilterBar(engine: engine)
            .padding()

            ScrollView {
                    VStack {
                        if (self.data.builtPeoples.count == 0) {
                            NoEvent()
                        } else {
                            let filteredPeople = self.data.builtPeoples.content.filter({$0.fullname.uppercased().contains(engine.textOutput.uppercased()) || engine.textOutput.isEmpty })
                            if (filteredPeople.isEmpty) {
                                NobodyWidget()
                            } else {
                                ForEach(filteredPeople.sorted(), id: \.self.fullname) { people in
                                    let anomaliesForPeopleIndex = self.data.builtPeoples.anomaliesForPeople.firstIndex(where: {$0.people_id == people.people_id})
                                        NavigationLink(
                                            destination: PeopleDetailsView(people: people, anomalies: self.data.builtPeoples.anomaliesForPeople[anomaliesForPeopleIndex!].anomalies.content),
                                            label: {
                                                PeopleTileViewCompact(people: people)
                                            })
                                        .buttonStyle(PlainButtonStyle())
                                        Divider()

                            }
                            }
                        }
                    }
                }
                .frame(minWidth:250)
                .navigationTitle("Collaborateurs")
}
}
}

struct PeopleListViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PeopleListViewCompact()
            
            PeopleListViewCompact()
        }
    }
}
