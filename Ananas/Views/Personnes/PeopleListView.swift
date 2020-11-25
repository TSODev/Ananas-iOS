//
//  PeopleListView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct PeopleListView: View {
    var peoples: [People]
    var noEventsText: String
    var isDiscover = false
    @ObservedObject var data = DataController.shared

    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {

                VStack {
         
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                ScrollView {



                    VStack {
                        if peoples.count == 0 {
                            Text(noEventsText)
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding(.top, 50)
                                .padding(.horizontal, 20)
                        } else {
                            ForEach(peoples.filter({$0.fullname.uppercased().contains(searchText.uppercased()) || searchText.isEmpty })) { people in
                                let anomalies = DataController.shared.anomalies.filter({$0.people_id == people.people_id})
                                NavigationLink(
                                    destination: PeopleDetailsView(people: people, anomalies: anomalies),
                                    label: {
                                        PeopleTileView(people: people)
                                    })
                                .buttonStyle(PlainButtonStyle())
                                Divider()
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
            PeopleListView(peoples: [samplePeople1,samplePeople2], noEventsText: "Nothing here :(")
                .colorScheme(.light)
        PeopleListView(peoples: [samplePeople1,samplePeople2], noEventsText: "Nothing here :(")
            .colorScheme(.dark)



    }
}
