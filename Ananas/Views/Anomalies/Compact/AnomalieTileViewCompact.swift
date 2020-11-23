//
//  AnomalieTileViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI

struct AnomalieTileViewCompact: View {
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
                Spacer()
                DateWidget(date: anomalie.debut, format: "dd MMMM YYYY")
                    .font(.caption)

            }
            .padding(.horizontal)
            HStack {
                CapsuleText(text: anomalie.hracode)
                if (anomalie.anomalie_from == "HRA") {
                    Image(systemName: "arrow.right.square.fill")
                }
                if (anomalie.anomalie_from == "LN") {
                    Image(systemName: "arrow.left.square.fill")
                }
                CapsuleText(text: anomalie.lncode)
            }
            HStack {
                Text(anomalie.libelle)
                    .font(.caption)
                    .padding(.top,5)
            }
            .padding(.horizontal, 10)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
        }
    }
}

struct AnomalieTileViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                AnomalieTileViewCompact(anomalie: sampleAnomalie1)
                AnomalieTileViewCompact(anomalie: sampleAnomalie2)
                AnomalieTileViewCompact(anomalie: sampleAnomalie3)
            }
            Spacer()

        }
    }
}
