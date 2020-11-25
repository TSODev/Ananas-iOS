//
//  AnomalieStateView.swift
//  Ananas
//
//  Created by Thierry Soulie on 25/11/2020.
//

import SwiftUI

struct AnomalieStateView: View {
    @ObservedObject var anomalie: Anomalie
    
    var body: some View {
        HStack {
        if (anomalie.etat == 1) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.red)
        } else if (anomalie.etat == 2) {
            Image(systemName: "circle.dashed.inset.fill")
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.orange)
        } else {
            Image(systemName: "checkmark.square.fill")
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(.green)
        }
        }
    }
}

struct AnomalieStateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnomalieStateView(anomalie: sampleAnomalie1)
            AnomalieStateView(anomalie: sampleAnomalie2)
            AnomalieStateView(anomalie: sampleAnomalie3)
        }
    }
}
