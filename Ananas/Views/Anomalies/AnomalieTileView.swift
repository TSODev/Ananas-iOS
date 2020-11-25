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
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.red)
                } else if (anomalie.etat == 2) {
                    Image(systemName: "circle.dashed.inset.fill")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.orange)
                } else {
                    Image(systemName: "checkmark.square.fill")
                        .font(.system(size: 40, weight: .regular))
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
                if (anomalie.anomalie_from == "BOTH") {
                    Image(systemName: "arrow.left.arrow.right.square.fill")
                }
                CapsuleText(text: anomalie.lncode)
//                CapsuleText(text: "\(anomalie.hracode) " + " / " + "\(anomalie.lncode) ")
                Spacer()
                Text(anomalie.libelle)
                    .font(.body)
                    .frame(width: 350, height: 50, alignment: .trailing)
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
