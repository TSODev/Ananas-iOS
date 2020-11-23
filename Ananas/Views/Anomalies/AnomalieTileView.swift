//
//  AnomalieTileView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI
import SwiftDate

struct AnomalieTileView: View {
    @ObservedObject var anomalie: Anomalie
    var body: some View {
        ScrollView {
        VStack {
            HStack {
                if (anomalie.etat == 1) {
                    Circle()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(.red)
                } else if (anomalie.etat == 2) {
                    Circle()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(.orange)
                } else {
                    Circle()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(.green)
                }

                DateWidget(date: anomalie.debut, format: "dd MMMM")
                    .font(.body)
                Spacer()
                CapsuleText(text: anomalie.hracode)
                if (anomalie.anomalie_from == "HRA") {
                    Image(systemName: "arrow.right.square.fill")
                }
                if (anomalie.anomalie_from == "LN") {
                    Image(systemName: "arrow.left.square.fill")
                }
                CapsuleText(text: anomalie.lncode)
//                CapsuleText(text: "\(anomalie.hracode) " + " / " + "\(anomalie.lncode) ")
                Spacer()
                Text(anomalie.libelle)
                    .font(.body)
            }
            .padding(.horizontal, 10)
        }
        }
    }
}

struct AnomalieTileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                AnomalieTileView(anomalie: sampleAnomalie1)
                AnomalieTileView(anomalie: sampleAnomalie2)
                AnomalieTileView(anomalie: sampleAnomalie3)
            }
            Spacer()

        }

    }
}
