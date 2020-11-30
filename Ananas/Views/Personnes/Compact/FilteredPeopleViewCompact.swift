//
//  FilteredPeopleViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI

struct FilteredPeopleViewCompact: View {
    var anomalies: [Anomalie]
    var people: People
    
    var body: some View {
        let anomalies = self.anomalies.filter({$0.people_id == people.people_id})
        let anomaliesContainer = AnomalieContainer(anomalies: anomalies)
        NavigationLink(
            destination: PeopleDetailsView(people: people, anomalies: anomalies ),
            label: {PeopleTileViewCompact(people: people)
                }

        )
        .buttonStyle(PlainButtonStyle())
    }
}

struct FilteredPeopleViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        FilteredPeopleViewCompact(anomalies: [sampleAnomalie1, sampleAnomalie2, sampleAnomalie3], people: samplePeople1)
    }
}
