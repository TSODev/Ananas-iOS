//
//  PeopleContainer.swift
//  Ananas
//
//  Created by Thierry Soulie on 28/11/2020.
//

import Foundation

struct peoplecontainer: Identifiable {
    let id = UUID()
    let contents: [People]
}

class PeopleContainer: ObservableObject {
    
    @Published var content = [People]()
    @Published var count = 0
    @Published var anomaliesForPeople = [AnomaliesForPeople]()
    
    struct AnomaliesForPeople {
        var people_id: Int
        var fullname: String
        var hasAnomalies: Bool
        var anomalies: AnomalieContainer
    }
    
    init(peoples: [People]) {
        self.content = peoples
        self.count = peoples.count
        var anomaliesArray: [AnomaliesForPeople] = []
        for people in peoples {
            var anomaliesByPeople = DataController.shared.anomalies.filter({$0.people_id == people.people_id})
            anomaliesArray.append(AnomaliesForPeople(
                                    people_id: people.people_id,
                                    fullname: people.fullname,
                                    hasAnomalies: (anomaliesByPeople.count > 0),
                                    anomalies: AnomalieContainer(anomalies: anomaliesByPeople
                                )))
            }
        self.anomaliesForPeople = anomaliesArray
        }
    }


