//
//  Metadata.swift
//  Ananas
//
//  Created by Thierry Soulie on 21/11/2020.
//

import Foundation

class Metadata:  ObservableObject, Identifiable, Codable {
    @Published var id: Int = 0
    @Published var group: String = ""
    @Published var key: String = ""
    @Published var value: String = ""
//    @Published var createddate: Date
    
    enum CodingKeys: String, CodingKey  {
        case _id
        case metadata_group
        case metadata_key
        case metadata_value
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys._id)
        try container.encode(group, forKey: CodingKeys.metadata_group)
        try container.encode(key, forKey: CodingKeys.metadata_key)
        try container.encode(value, forKey: CodingKeys.metadata_value)

    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: ._id)
        group = try values.decode(String.self, forKey: .metadata_group)
        key = try values.decode(String.self, forKey: .metadata_key)
        value = try values.decode(String.self, forKey: .metadata_value)
    }
    
    init() {
    }
}

var sampleMetada1: Metadata {
    let metadata = Metadata()
    
    metadata.id = 1
    metadata.group = "LN"
    metadata.key = "fileName"
    metadata.value = "Base Chômage partiel - septembre 2020.xlsx"

    return metadata
    }
var sampleMetada2: Metadata {
    let metadata = Metadata()
    
    metadata.id = 2
    metadata.group = "LN"
    metadata.key = "lastLoaded"
    metadata.value = "samedi 31 octobre 2020 à 10:50:33"

    return metadata
    }
var sampleMetada3: Metadata {
    let metadata = Metadata()
    
    metadata.id = 3
    metadata.group = "ANOMALIES"
    metadata.key = "lastLoaded"
    metadata.value = "samedi 31 octobre 2020 à 10:50:33"

    return metadata
    }

 var sampleMetadataList = [sampleMetada1, sampleMetada2, sampleMetada3]

