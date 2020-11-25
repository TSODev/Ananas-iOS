//
//  FilteredPeopleView.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI

struct FilteredPeopleView: View {
//    var anomalies: [Anomalie]
    var people: People
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        let anomalies = data.anomalies.filter({$0.people_id == people.people_id})

        NavigationLink(
            destination: PeopleDetailsView(people: people, anomalies: anomalies ),
            label: {PeopleTileView(people: people)
                }

        )
        .buttonStyle(PlainButtonStyle())
    }
}

struct FilteredPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredPeopleView(people: samplePeople1)
    }
}
