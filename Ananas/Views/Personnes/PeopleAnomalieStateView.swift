//
//  PeopleAnomalieStateView.swift
//  Ananas
//
//  Created by Thierry Soulie on 23/11/2020.
//

import SwiftUI

struct PeopleAnomalieStateView: View {
    
//    var anomalies: AnomalieContainer
    var people: People
    var body: some View {
        
//            let anomalies = DataController.shared.anomalies.filter({$0.people_id == people.people_id})
        let anomalies = AnomalieContainer(anomalies: DataController.shared.anomalies.filter({$0.people_id == people.people_id}))

        HStack {
            Spacer()
            ForEach(anomalies.content) { anomalie in
                AnomalieStateView(anomalie: anomalie)
            }
        }

//        Spacer()
    }
}

struct PeopleAnomalieStateView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleAnomalieStateView(people: samplePeople1)
        PeopleAnomalieStateView(people: samplePeople2)
    }
}
