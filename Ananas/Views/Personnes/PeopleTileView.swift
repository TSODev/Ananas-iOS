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
//    @ObservedObject var people: People
    var people: People
    @ObservedObject var data = DataController.shared
    
    
    var body: some View {
        HStack {
        HStack {
            let anomalies = data.anomalies.filter({$0.people_id == people.people_id})
            VStack(spacing: 0) {
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
                .font(.title3)
            }
        .frame(width: 350, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }

}

struct PeopleTileView_Previews: PreviewProvider {
    static var previews: some View {

        PeopleTileView(people: samplePeople1)
        PeopleTileView(people: samplePeople2)

    }
}
