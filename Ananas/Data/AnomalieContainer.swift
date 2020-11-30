//
//  AnomalieContainer.swift
//  Ananas
//
//  Created by Thierry Soulie on 26/11/2020.
//

import Foundation

struct container: Identifiable {
    let id = UUID()
    let contents: [Anomalie]
}

class AnomalieContainer: ObservableObject {
    
    @Published var content = [Anomalie]()
    @Published var count = 0
    var fullState = 0
    var maxState = 0
    @Published var hasClearedAnomalies = false
    
    init(anomalies: [Anomalie]) {
        self.content = anomalies
        self.count = anomalies.count
        self.fullState = anomalies.map({$0.etat}).reduce(0, +)
        self.maxState = self.count * 3
        self.hasClearedAnomalies = (self.fullState == self.maxState)
    }
    
    func testIfCleared() {
        self.hasClearedAnomalies = (self.fullState == self.maxState)
    }
    
    func fillContainer(anomalies: [Anomalie]) {
        self.content = anomalies
        self.count = anomalies.count
        self.fullState = anomalies.map({$0.etat}).reduce(0, +)
        self.maxState = self.count * 3
    }
}
