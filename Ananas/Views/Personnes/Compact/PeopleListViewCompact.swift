//
//  PeopleListViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI

struct PeopleListViewCompact: View {
    
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
                                let anomalies = data.anomalies.filter({$0.people_id == people.people_id})
                                FilteredPeopleViewCompact(anomalies: anomalies, people: people)
                                Divider()
                            }
                        }
                    }
                }
                .frame(minWidth:250)
                .navigationTitle("Collaborateurs")
        }
}

//struct mySearchBar: View {
//    @Binding var searchText: String
//    @Binding var isSearching: Bool
//    var body: some View {
//        HStack {
//            HStack {
//                TextField("Filtre par nom", text: $searchText)
//                    .padding(.leading, 24)
//            }
//            .padding()
//            .background(Color(.systemGray5))
//            .cornerRadius(6)
//            .padding(.horizontal)
//            .onTapGesture {
//                isSearching = true
//            }
//            .overlay(
//                    HStack {
//                        Image(systemName: "magnifyingglass")
//                        Spacer()
//                        if (isSearching) {
//                            Button(action: {searchText = ""}, label: {
//                                Image(systemName: "xmark.circle.fill")
//                                    .padding(.vertical)
//                            })
//
//                        }
//                    }
//                    .padding(.horizontal, 32)
//                    .foregroundColor(.gray)
//            ).transition(.move(edge: .trailing))
//            .animation(.spring())
//
//            HStack {
//                if (isSearching) {
//                    Button(action: {
//                        isSearching = false
//                        searchText = ""
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                    }, label: {
//                        Text("Annule")
//                            .padding(.trailing)
//                            .padding(.leading, -12)
//                    })
//                    .transition(.move(edge: .trailing))
//                    .animation(.spring())
//                }
//
//            }
//
//        }
//
//    }
//}
}

struct PeopleListViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PeopleListViewCompact(peoples: [samplePeople1,samplePeople2], noEventsText: "Nothing here :(")
            
            PeopleListViewCompact(peoples: [], noEventsText: "Nothing here :(")
        }
    }
}
