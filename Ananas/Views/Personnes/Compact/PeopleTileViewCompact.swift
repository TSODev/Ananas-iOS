//
//  PeopleTileViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI

struct PeopleTileViewCompact: View {
    var people: People
//    var anomalies: AnomalieContainer
//    var data = DataController.shared

        
        var body: some View {
            
            let anomalies = AnomalieContainer(anomalies: DataController.shared.anomalies.filter({$0.people_id == people.people_id}))
            
            HStack {
                VStack(spacing: 0) {
                    VStack {
                        HStack {
                            GlobalState(anomalies: anomalies)
//                            Spacer()
                                Text(people.fullname)
                                        .font(.title2)
                                Spacer()
                        }
                        .padding(.horizontal)

//                        HStack {
//                            HStack{
//                                if (anomalies.content.count > 0) {
//                                    PeopleAnomalieStateView(people: people)
//                                }
//                            }
//                            Spacer()
//                        }
//                        .padding(.horizontal,10)
//                        .padding(.bottom, 5)

                    }
                    .padding(.top)
                    .font(.title3)
                }
            }
            .frame(width: 350)
//            .onAppear(perform: {
//                debugPrint("Appear : PeopleTileViewCompact -  \(people.fullname)")
//            })
//            .onDisappear(perform: {
//                debugPrint("Disappear : PeopleTileViewCompact")
//            })
            }


}

struct PeopleTileViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        PeopleTileViewCompact(people: samplePeople1)
            .previewDevice("iPhone X")
        PeopleTileViewCompact(people: samplePeople2)
            .previewDevice("iPhone X")
    }
}
