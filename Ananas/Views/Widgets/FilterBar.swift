//
//  SearchBar.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//


import SwiftUI
import Combine

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct FilterBar: View {

    @State var isSearching: Bool = false
    @ObservedObject var engine:TextEngine
    
    var body: some View {
        HStack {
            HStack {
//                TextField("Filtre par nom", text: $searchText)
                TextField("Filtre par nom", text: $engine.textInput)
                    .disableAutocorrection(true)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: { isSearching = true})
            .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        if (isSearching) {
                            Button(action: {engine.textInput = ""}, label: {
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
                        engine.textInput = ""
                        self.hideKeyboard()
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

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        FilterBar(engine: (TextEngine()))
        FilterBar(engine: (TextEngine()))
    }
}
