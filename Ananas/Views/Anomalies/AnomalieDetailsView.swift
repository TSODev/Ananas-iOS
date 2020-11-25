//
//  AnomalieDetailsView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct AnomalieDetailsView: View {
    var anomalie: Anomalie

    var body: some View {
        VStack {
            HStack {
                Image("default-avatar")
                Spacer()
                Text(anomalie.fullname)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal,50)

            HStack {
                Section {
                    HStack {
                        FormLabelView(title: "TGI:", iconSystemName: "person.fill", color: .blue)
                        Text(anomalie.tgi)
                    }
                }
                Spacer()
                HStack {
                    FormLabelView(title: "Matricule:", iconSystemName: "person.fill", color: .blue)
                    Text("\(anomalie.matricule)")
                }
            }
            .font(.title2)
            .padding(.vertical,5)
            .padding(.horizontal,30)
            Rectangle()
                .frame(width: 700, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack {
                HStack {
                    FormLabelView(title: "", iconSystemName: "calendar", color: .orange)
                    DateWidget(date: anomalie.debut, format: "dd MMMM")
                }
                Spacer()
                Text("Code HRA:")
                    .padding()
                CapsuleText(text: anomalie.hracode)
                Text("Code LN:")
                    .padding()
                CapsuleText(text: anomalie.lncode)
            }
            .font(.title2)
            .padding(.horizontal, 30)
            HStack {
                Text(anomalie.libelle)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical,5)
            
            VStack(alignment: .leading) {
                AnomalieUpdateFormView(anomalie: anomalie)
            }
            .padding(.bottom)
            
        }
//        .background(Color.white)
        .cornerRadius(10)
//        .shadow(radius: 15)
        .padding(.horizontal)
//        })
        
    }
    
}

struct AnomalieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AnomalieDetailsView(anomalie: sampleAnomalie1)
        AnomalieDetailsView(anomalie: sampleAnomalie2)
        AnomalieDetailsView(anomalie: sampleAnomalie3)
    }
}
