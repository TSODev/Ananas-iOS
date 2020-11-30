//
//  PeopleTileByGlobalState.swift
//  Ananas
//
//  Created by Thierry Soulie on 26/11/2020.
//

import SwiftUI

struct PeopleTileByGlobalState: View {
//    var anomalies: AnomalieContainer
    var people: People
    @ObservedObject var data = DataController.shared
    
    
    var body: some View {

        let index = self.data.builtPeoples.anomaliesForPeople.firstIndex(where: {$0.people_id == people.people_id})
        let anomalies = self.data.builtPeoples.anomaliesForPeople[index!].anomalies
        
//        let anomalies = AnomalieContainer(anomalies: DataController.shared.anomalies.filter({$0.people_id == people.people_id}))
        
        HStack {
            if (anomalies.count > 0) {
//                if ( anomalies.fullState == anomalies.maxState ) {
                    if ( anomalies.hasClearedAnomalies ) {
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                            .font(.system(size: 40, weight: .regular))
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "person.crop.circle.badge.exclamationmark")
                            .font(.system(size: 40, weight: .regular))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                        }
                }
                else
                {
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(.green)
                }
            }
            .onAppear(perform: {
                if (people.fullname == "ABDAT Maelle") {
                    debugPrint("Appear :\(people.people_id) \(people.fullname) \(anomalies.content.map({$0.anomalie_id})) \(anomalies.fullState) \(anomalies.maxState)")
                }

            })
            .onDisappear(perform: {
                if (people.fullname == "ABDAT Maelle") {
                    debugPrint("Disappear : \(people.people_id) \(people.fullname) \(anomalies.content.map({$0.anomalie_id})) \(anomalies.fullState) \(anomalies.maxState)")
                }
            })
    }
    

struct PeopleTileByGlobalState_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PeopleTileByGlobalState(people: samplePeople1)
            PeopleTileByGlobalState(people: samplePeople2)
        }
    }
}
}

