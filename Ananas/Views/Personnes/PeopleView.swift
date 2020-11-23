//
//  PeopleView.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import SwiftUI

struct PeopleView: View {
    @ObservedObject var people: People
    

    
    var body: some View {
        Text(people.fullname)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(people: samplePeople1)
    }
}
