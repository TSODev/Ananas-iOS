//
//  AnomaliesListView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct AnomaliesListView: View {
    var anomaliesList: [Anomalie]
    var noAnomalieText: String
    
    var body: some View {
        ScrollView {
            VStack {
                if anomaliesList.count == 0 {
                    Text(noAnomalieText)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 50)
                        .padding(.horizontal, 20)
                } else {
                    ForEach(anomaliesList.sorted(), id: \.self.debut) { anomalie in
                        NavigationLink(
                            destination: AnomalieDetailsView(anomalie: anomalie),
                            label: {AnomalieTileView(anomalie: anomalie)}

                        )
                        .buttonStyle(PlainButtonStyle())
                        .font(.title2)
                        .padding(.vertical,5)
                    }
                }

            }
        }
    }
}

struct AnomaliesListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnomaliesListView(anomaliesList: [sampleAnomalie1, sampleAnomalie2, sampleAnomalie3], noAnomalieText: "Tout est normal")
            AnomaliesListView(anomaliesList: [], noAnomalieText: "Tout est normal")
        }

    }
}
