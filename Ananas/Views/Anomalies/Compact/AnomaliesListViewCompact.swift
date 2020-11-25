//
//  AnomalieListViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI

struct AnomaliesListViewCompact: View {
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
                    ForEach(anomaliesList) { anomalie in
                        NavigationLink(
                            destination: AnomalieDetailsViewCompact(anomalie: anomalie),
                            label: {AnomalieTileViewCompact(anomalie: anomalie)}

                        )
                        .buttonStyle(PlainButtonStyle())
                        .font(.title2)
 //                       .padding(.vertical,5)
                        Divider()
                    }
                }

            }
        }
    }
}

struct AnomalieListViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnomaliesListViewCompact(anomaliesList: [sampleAnomalie1, sampleAnomalie2], noAnomalieText: "Tout est normal")
            AnomaliesListViewCompact(anomaliesList: [], noAnomalieText: "Tout est normal")
        }
    }
}
