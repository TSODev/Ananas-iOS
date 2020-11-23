//
//  PeopleTileView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct PeopleTileView: View {
//    #if !os(macOS)
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//    #endif
    @ObservedObject var people: People
    var anomalies: [Anomalie]

    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                VStack {
                    HStack{
                        if (anomalies.count > 0) {
                            Rectangle()
                                .frame( height: 15)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                        } else {
                            Rectangle()
                                .frame( height: 15)
                                .foregroundColor(.green)
                        }

                    }
                    HStack {

                        HStack{
                            HStack {
                                Text("TGI: \(people.tgi)")
                            }
                            Spacer()
                            HStack {
                                Text("\( people.matricule)")
                            }
                        }
                        .padding(.horizontal)
                        .font(.body)
                    }
                }
                    HStack {
                        Text(people.fullname)
                            .font(.title2)
//                            .padding(10)
                        Spacer()

                    }
                    .padding()

//                HStack {
//                    HStack{
//                        if (anomalies.count > 0) {
//                            PeopleAnomaliesStateView(anomalies: anomalies)
//                        }
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal,10)
//                .padding(.bottom, 5)

                }
                .background(Color.white)
                .font(.title3)
 //               .padding(.trailing, 10)
                .background(Color.white)
            }
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
        }

}

struct PeopleTileView_Previews: PreviewProvider {
    static var previews: some View {

        PeopleTileView(people: samplePeople1, anomalies: [sampleAnomalie1, sampleAnomalie2, sampleAnomalie3])
        PeopleTileView(people: samplePeople1, anomalies: [])

    }
}
