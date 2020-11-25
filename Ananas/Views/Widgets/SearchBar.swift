//
//  SearchBar.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//


import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var body: some View {
        HStack {
            HStack {
                TextField("Filtre par nom", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        if (isSearching) {
                            Button(action: {searchText = ""}, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            })
                            
                        }
                    }
                    .padding(.horizontal, 32)
                    .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            HStack {
                if (isSearching) {
                    Button(action: {
                        isSearching = false
                        searchText = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }, label: {
                        Text("Annule")
                            .padding(.trailing)
                            .padding(.leading, -12)
                    })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                }

            }

        }

    }

}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(searchText: <#Binding<String>#>, isSearching: <#Binding<Bool>#>)
//    }
//}