//
//  PeopleListView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

let engine = TextEngine()

struct PeopleListView: View {


    var noEventsText: String = "En attente ..."

    @ObservedObject var data = DataController.shared
    @ObservedObject var peoples: PeopleContainer = DataController.shared.builtPeoples
    @ObservedObject var engine: TextEngine = TextEngine()
    
//    @State var name: String
//    @State var tgi: String
//    @State var matricule: String
    
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
                                                        PeopleTileView(people: people)
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


struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
            PeopleListView()
                .colorScheme(.light)
        PeopleListView()
            .colorScheme(.dark)



    }
}
