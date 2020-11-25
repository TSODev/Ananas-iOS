//
//  PeopleAnomalieStateView.swift
//  Ananas
//
//  Created by Thierry Soulie on 23/11/2020.
//

import SwiftUI

struct PeopleAnomalieStateView: View {
    var anomalies: [Anomalie]
    var body: some View {
        HStack {
            Spacer()
            ForEach(anomalies) { anomalie in
                AnomalieStateView(anomalie: anomalie)
            }
        }

//        Spacer()
    }
}

struct PeopleAnomalieStateView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleAnomalieStateView(anomalies: [sampleAnomalie1, sampleAnomalie2, sampleAnomalie3])
    }
}
