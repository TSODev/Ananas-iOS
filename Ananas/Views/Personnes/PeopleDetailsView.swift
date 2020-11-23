//
//  PeopleDetailsView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct PeopleDetailsView: View {

    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @ObservedObject var people: People
    var anomalies: [Anomalie]
    @State var deleted = false
    
    
    var body: some View {
        if (horizontalSizeClass == .compact) {
            compact
        }
        else
        {
            large
        }
    }
    
    var large: some View {
        VStack {
            VStack(spacing: 0) {
                Image("default-avatar")
                HStack {
                    Text(people.fullname)
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    Spacer()
                }
                .padding()

            }

            VStack {
                AnomaliesListView(anomaliesList: anomalies, noAnomalieText: "Aucune anomalie détectée")
            }
    }
}
    
    var compact: some View {
        VStack {
            HStack {
                Text(people.fullname)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    //                    Spacer()
            }
            .padding()
            VStack {
                AnomalieListViewCompact(anomaliesList: anomalies, noAnomalieText: "Aucune anomalie détectée")
            }
        }

    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        PeopleDetailsView(people: samplePeople1, anomalies: [sampleAnomalie1,sampleAnomalie1,sampleAnomalie1,sampleAnomalie1])
    }
}
