//
//  PeopleTileViewCompact.swift
//  Ananas
//
//  Created by Thierry Soulie on 24/11/2020.
//

import SwiftUI

struct PeopleTileViewCompact: View {
    var people: People
    @ObservedObject var data = DataController.shared

        
        var body: some View {
            HStack {
                let anomalies: [Anomalie] = data.anomalies.filter({$0.people_id == people.people_id})
                
                VStack(spacing: 0) {
                    VStack {
//                        LineWidget()
                        HStack {
                            HStack {
                                if (anomalies.count > 0) {
                                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                                        .font(.system(size: 40, weight: .regular))
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                                } else {
                                    Image(systemName: "person.crop.circle.badge.checkmark")
                                        .font(.system(size: 40, weight: .regular))
                                        .foregroundColor(.green)
                                    }
                            }
//                            Spacer()
                                Text(people.fullname)
                                        .font(.title2)
                                Spacer()
                        }
                        .padding(.horizontal)

                        HStack {
                            HStack{
                                if (anomalies.count > 0) {
                                    PeopleAnomalieStateView(anomalies: anomalies)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal,10)
                        .padding(.bottom, 5)

                    }
 //                   .background(Color.white)
                    .padding(.top)
                    .font(.title3)
                }
            }
            .frame(width: 350)
            }


}

struct PeopleTileViewCompact_Previews: PreviewProvider {
    static var previews: some View {
        PeopleTileViewCompact(people: samplePeople1)
        PeopleTileViewCompact(people: samplePeople2)
    }
}
