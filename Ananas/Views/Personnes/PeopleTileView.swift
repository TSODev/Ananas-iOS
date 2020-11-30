//
//  PeopleTileView.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import SwiftUI

struct PeopleTileView: View {

    var people: People
//    @ObservedObject var anomalies: AnomalieContainer
//    @ObservedObject var data = DataController.shared
    
    
    var body: some View {
//        HStack {
//        HStack {
            
        let anomalies = AnomalieContainer(anomalies: DataController.shared.anomalies.filter({$0.people_id == people.people_id}))

            VStack(spacing: 0) {
                HStack {
//                    PeopleTileByGlobalState(people: people)
                    GlobalState(anomalies: anomalies)
                        Text(people.fullname)
                                .font(.title2)
                        Spacer()
                }
                .padding(.horizontal)
//                HStack {
//                    HStack{
//                        if (anomalies.content.count > 0) {
//                            PeopleAnomalieStateView(people: people)
//                        }
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal,10)
//                .padding(.bottom, 5)
            }
        .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }

}

struct PeopleTileView_Previews: PreviewProvider {
    static var previews: some View {

        PeopleTileView(people: samplePeople1)
            .previewDevice("iPad (8th generation)")
        PeopleTileView(people: samplePeople2)
            .previewDevice("iPad (8th generation)")

    }
}
