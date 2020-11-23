//
//  People.swift
//  Ananas
//
//  Created by Thierry Soulie on 17/11/2020.
//

import Foundation
import SwiftDate

class People: ObservableObject, Identifiable, Codable {
    
    enum Sources {
        case LN
        case HRA
    }
    
    @Published var people_id = 0
    @Published var source = 0
    @Published var matricule = 0
    @Published var tgi = ""
    @Published var fullname = ""
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var posact = ""
    @Published var entree = Date()
//    @Published var sortie = Date()
    @Published var createddate = Date()
    
    enum CodingKeys: String, CodingKey  {
        case people_id
        case source
        case matricule
        case tgi
        case fullname
        case firstname
        case lastname
        case posact
        case entree
//        case sortie
        case createddate
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(people_id, forKey: CodingKeys.people_id)
        try container.encode(source, forKey: CodingKeys.source)
        try container.encode(matricule, forKey: CodingKeys.matricule)
        try container.encode(tgi, forKey: CodingKeys.tgi)
        try container.encode(fullname, forKey: CodingKeys.fullname)
        try container.encode(firstname, forKey: CodingKeys.firstname)
        try container.encode(lastname, forKey: CodingKeys.lastname)
        try container.encode(posact, forKey: CodingKeys.posact)
        try container.encode(DateInRegion(entree), forKey: CodingKeys.entree)
//        try container.encode(DateInRegion(sortie), forKey: CodingKeys.sortie)
        try container.encode(DateInRegion(createddate), forKey: CodingKeys.createddate)
    }
    
    
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        people_id = try values.decode(Int.self, forKey: .people_id)
        source = try values.decode(Int.self, forKey: .source)
        matricule = try values.decode(Int.self, forKey: .matricule)
        tgi = try values.decode(String.self, forKey: .tgi)
        if (source == 1) {
            fullname = try values.decode(String.self, forKey: .fullname)
            fullname = try values.decode(String.self, forKey: .fullname)
            firstname = try values.decode(String.self, forKey: .firstname)
            lastname = try values.decode(String.self, forKey: .lastname)
            posact = try values.decode(String.self, forKey: .posact)
            let entreeStr = try values.decode(String.self, forKey: .entree)
            entree = entreeStr.toDate()!.date
    //        let sortieStr = try values.decode(String.self, forKey: .sortie)
    //        sortie = sortieStr.toDate()!.date
            let createddateStr = try values.decode(String.self, forKey: .createddate)
            createddate = createddateStr.toDate()!.date
        } else {
            fullname = "Inconnu"
            firstname = ""
            lastname = ""
            posact = ""
            entree = Date()
            createddate = Date()
        }
    }
    
    
    init() {
    }


}
var demoPeople: People {
    let people = People()
    
    people.people_id =  1
    people.source = 1
    people.matricule = 999999
    people.tgi = "T012345"
    people.fullname = "Choisir un collaborateur..."
    people.posact = "1PA"
    people.entree = "1999-04-30T22:00:00.000Z".toDate()!.date
    people.createddate = "2020-10-31T00:00:00.000Z".toDate()!.date
    
    return people
}

var samplePeople1: People {
    let people = People()
    
    people.people_id =  1
    people.source = 1
    people.matricule = 742700
    people.tgi = "T0030248"
    people.fullname = "BEN SEDRINE Saida"
    people.posact = "1PA"
    people.entree = "1999-04-30T22:00:00.000Z".toDate()!.date
    people.createddate = "2020-10-31T00:00:00.000Z".toDate()!.date
    
    return people
}
