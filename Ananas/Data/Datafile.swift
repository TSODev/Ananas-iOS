//
//  Datafile.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import Foundation
import SwiftDate

class Datafile:  ObservableObject, Identifiable, Codable {
    @Published var id: Int = 0
    @Published var loadDate: Date = Date()
    @Published var filename: String = ""
    @Published var nbrecords: Int = 0
//  @Published var createddate: Date
    
    enum CodingKeys: String, CodingKey  {
        case datafile_id
        case datafileloaddate
        case datafilename
        case nbrecords
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.datafile_id)
        try container.encode(DateInRegion(loadDate), forKey: CodingKeys.datafileloaddate)
        try container.encode(filename, forKey: CodingKeys.datafilename)
        try container.encode(nbrecords, forKey: CodingKeys.nbrecords)

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .datafile_id)
        let dateStr = try values.decode(String.self, forKey: .datafileloaddate)
        loadDate = dateStr.toDate()!.date
        filename = try values.decode(String.self, forKey: .datafilename)
        nbrecords = try values.decode(Int.self, forKey: .nbrecords)
    }
    
    init() {
    }
    

}


var sampleDatafile1: Datafile {
    let datafile = Datafile()
    
    datafile.id =  2
    datafile.filename = "Absences 09-2020.xlsx"
    datafile.loadDate = Date()
    datafile.nbrecords =  5349

    
    return datafile
}
