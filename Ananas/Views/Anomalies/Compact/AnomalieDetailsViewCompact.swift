//
//  AnomalieDetailsViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 22/11/2020.
//

import SwiftUI

struct AnomalieDetailsViewCompact: View {
    var anomalie: Anomalie

    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    HStack {
                        Text(anomalie.fullname)
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .padding()
                    HStack {
                        FormLabelView(title: "TGI:", iconSystemName: "person.fill", color: .blue)
                        Text(anomalie.tgi)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    HStack {
                        FormLabelView(title: "Matricule:", iconSystemName: "person.fill", color: .blue)
                        Text("\(anomalie.matricule)")
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    HStack {
                        FormLabelView(title: "", iconSystemName: "calendar", color: .orange)
                        DateWidget(date: anomalie.debut, format: "dd MMMM YYYY")
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    HStack {
                        CapsuleText(text: anomalie.hracode)
                        Spacer()
                        CapsuleText(text: anomalie.lncode)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .font(.title3)
                    HStack {
                        Text(anomalie.libelle)
                            .font(.body)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.vertical,5)
                }
            }
           
            VStack(alignment: .leading) {
                AnomalieUpdateFormViewCompact(anomalie: anomalie)
            }
            .padding(.top, 20)
            .padding(.bottom)
        }
        .padding(.horizontal)
//        })
        
    }

}

struct AnomalieDetailsViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        AnomalieDetailsViewCompact(anomalie: sampleAnomalie1)
            .colorScheme(.light)
        AnomalieDetailsViewCompact(anomalie: sampleAnomalie2)
        AnomalieDetailsViewCompact(anomalie: sampleAnomalie3)
    }
}
