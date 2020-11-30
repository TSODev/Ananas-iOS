//
//  Anomalie.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//

import Foundation
import SwiftDate


//{
//  "anomalie_id": 2,
//  "people_id": 69,
//  "anomalie_from": "LN",
//  "etat": 1,
//  "hracode": "CL3",
//  "lncode": ".RTTs",
//  "libelle": "LN: .RTTs ne correspond pas avec HRA: CL3",
//  "debut": "2020-09-02T00:00:00.000Z",
//  "commentaire": "",
//  "source": 1,
//  "fullname": "GAUTIER Antoine",
//  "tgi": "T0243167",
//  "matricule": 901533
//}

class Anomalie: ObservableObject, Identifiable, Codable, Comparable, Hashable {
        
enum Sources {
    case LN
    case HRA
}

@Published var anomalie_id = 0
@Published var people_id = 0
@Published var anomalie_from = ""
@Published var etat = 0
var hracode = ""
var lncode = ""
var libelle = ""
var debut = Date()
@Published var commentaire = ""
var source = 0
var fullname = ""
var tgi = ""
var matricule = 0

enum CodingKeys: String, CodingKey  {
    case anomalie_id
    case people_id
    case anomalie_from
    case etat
    case hracode
    case lncode
    case libelle
    case debut
    case commentaire
    case source
    case fullname
    case tgi
    case matricule
}

    static func < (lhs: Anomalie, rhs: Anomalie) -> Bool {
        if lhs.debut.year != rhs.debut.year {
            return lhs.debut.year < rhs.debut.year
        } else if lhs.debut.month != rhs.debut.month {
            return lhs.debut.month < rhs.debut.month
        } else {
            return lhs.debut.day < rhs.debut.day
        }
    }
    
    static func == (lhs: Anomalie, rhs: Anomalie) -> Bool {
        return lhs.debut.year == rhs.debut.year && lhs.debut.month == rhs.debut.month
            && lhs.debut.day == rhs.debut.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(anomalie_id)
        hasher.combine(people_id)
        hasher.combine(anomalie_from)
        hasher.combine(etat)
        hasher.combine(hracode)
        hasher.combine(lncode)
        hasher.combine(libelle)
        hasher.combine(commentaire)
        hasher.combine(debut)
        hasher.combine(source)
        hasher.combine(fullname)
        hasher.combine(tgi)
        hasher.combine(matricule)
    }
    
func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(anomalie_id, forKey: CodingKeys.anomalie_id)
    try container.encode(people_id, forKey: CodingKeys.people_id)
    try container.encode(anomalie_from, forKey: CodingKeys.anomalie_from)
    try container.encode(etat, forKey: CodingKeys.etat)
    try container.encode(hracode, forKey: CodingKeys.hracode)
    try container.encode(lncode, forKey: CodingKeys.lncode)
    try container.encode(libelle, forKey: CodingKeys.libelle)
    try container.encode(commentaire, forKey: CodingKeys.commentaire)
    try container.encode(DateInRegion(debut), forKey: CodingKeys.debut)
    try container.encode(source, forKey: CodingKeys.source)
    try container.encode(fullname, forKey: CodingKeys.fullname)
    try container.encode(tgi, forKey: CodingKeys.tgi)
    try container.encode(matricule, forKey: CodingKeys.matricule)
}



required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    anomalie_id = try values.decode(Int.self, forKey: .anomalie_id)
    people_id = try values.decode(Int.self, forKey: .people_id)
    anomalie_from = try values.decode(String.self, forKey: .anomalie_from)
    etat = try values.decode(Int.self, forKey: .etat)
    hracode = try values.decode(String.self, forKey: .hracode)
    lncode = try values.decode(String.self, forKey: .lncode)
    libelle = try values.decode(String.self, forKey: .libelle)
    commentaire = try values.decode(String.self, forKey: .commentaire)
    let debutStr = try values.decode(String.self, forKey: .debut)
    debut = debutStr.toDate()!.date
    source = try values.decode(Int.self, forKey: .source)
    fullname = try values.decode(String.self, forKey: .fullname)
    tgi = try values.decode(String.self, forKey: .tgi)
    matricule = try values.decode(Int.self, forKey: .matricule)
}


init() {
}

    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        if debut.compare(.isThisYear) {
            formatter.dateFormat = "d MMM"
        } else {
            formatter.dateFormat = "d MMM yyyy"
        }
        return formatter.string(from: debut)
    }
    
    func dateInFormat(format: String) -> String {
        return debut.toFormat(format, locale: Locales.french)
    }
    
}


var sampleAnomalie1: Anomalie {
    let anomalie = Anomalie()
    
    anomalie.anomalie_id = 2        //  "anomalie_id": 2,
    anomalie.people_id = 69         //  "people_id": 69,
    anomalie.anomalie_from = "LN"   //  "anomalie_from": "LN",
    anomalie.etat = 1               //  "etat": 1,
    anomalie.hracode = "CL3"        //  "hracode": "CL3",
    anomalie.lncode = ".RTTs"       //  "lncode": ".RTTs",
    anomalie.libelle = "LN: .RTTs ne correspond pas avec HRA: CL3"  //  "libelle": "LN: .RTTs ne correspond pas avec HRA: CL3",
    anomalie.debut = "2020-08-15T00:00:00.000Z".toDate()!.date        //  "debut": "2020-09-02T00:00:00.000Z",
    anomalie.commentaire = ""       //  "commentaire": "",
    anomalie.source = 1             //  "source": 1,
    anomalie.fullname = "GAUTIER Antoine"   //  "fullname": "GAUTIER Antoine",
    anomalie.tgi = "T0243167"       //  "tgi": "T0243167",
    anomalie.matricule = 901533     //  "matricule": 901533

    
    return anomalie
}

var sampleAnomalie2: Anomalie {
    let anomalie = Anomalie()
    
    anomalie.anomalie_id = 2        //  "anomalie_id": 2,
    anomalie.people_id = 69         //  "people_id": 69,
    anomalie.anomalie_from = "HRA"   //  "anomalie_from": "LN",
    anomalie.etat = 2               //  "etat": 1,
    anomalie.hracode = "CL3"        //  "hracode": "CL3",
    anomalie.lncode = ".RTTs"       //  "lncode": ".RTTs",
    anomalie.libelle = "LN: .RTTs ne correspond pas avec HRA: CL3"  //  "libelle": "LN: .RTTs ne correspond pas avec HRA: CL3",
    anomalie.debut = "2020-09-02T00:00:00.000Z".toDate()!.date        //  "debut": "2020-09-02T00:00:00.000Z",
    anomalie.commentaire = "Commentaire"       //  "commentaire": "",
    anomalie.source = 1             //  "source": 1,
    anomalie.fullname = "GAUTIER Antoine"   //  "fullname": "GAUTIER Antoine",
    anomalie.tgi = "T0243167"       //  "tgi": "T0243167",
    anomalie.matricule = 901533     //  "matricule": 901533

    
    return anomalie
}

var sampleAnomalie3: Anomalie {
    let anomalie = Anomalie()
    
    anomalie.anomalie_id = 2        //  "anomalie_id": 2,
    anomalie.people_id = 69         //  "people_id": 69,
    anomalie.anomalie_from = "LN"   //  "anomalie_from": "LN",
    anomalie.etat = 3               //  "etat": 1,
    anomalie.hracode = "CL3"        //  "hracode": "CL3",
    anomalie.lncode = ".RTTs"       //  "lncode": ".RTTs",
    anomalie.libelle = "LN: .RTTs ne correspond pas avec HRA: CL3"  //  "libelle": "LN: .RTTs ne correspond pas avec HRA: CL3",
    anomalie.debut = "2020-09-01T00:00:00.000Z".toDate()!.date        //  "debut": "2020-09-02T00:00:00.000Z",
    anomalie.commentaire = ""       //  "commentaire": "",
    anomalie.source = 1             //  "source": 1,
    anomalie.fullname = "GAUTIER Antoine"   //  "fullname": "GAUTIER Antoine",
    anomalie.tgi = "T0243167"       //  "tgi": "T0243167",
    anomalie.matricule = 901533     //  "matricule": 901533

    
    return anomalie
}
