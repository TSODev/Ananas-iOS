//
//  User.swift
//  Ananas
//
//  Created by Thierry Soulie on 19/11/2020.
//


import Foundation
import SwiftDate

class User: ObservableObject, Identifiable, Codable {
    
    enum Roles {
        case ADMIN
        case LOCALADMIN
        case USER
        case VIEWVER
    }
    
//    @Published var company = ""
    @Published var email = ""
    @Published var firstname = ""
    @Published var lastname = ""
//    @Published var roles: [Roles]
    @Published var user_id = 0

    
    enum CodingKeys: String, CodingKey  {
        case user_id
//        case company
        case email
        case firstname
        case lastname
        case roles
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(user_id, forKey: CodingKeys.user_id)
//        try container.encode(company, forKey: CodingKeys.company)
        try container.encode(email, forKey: CodingKeys.email)
        try container.encode(firstname, forKey: CodingKeys.firstname)
        try container.encode(lastname, forKey: CodingKeys.lastname)

    }
    
    
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decode(Int.self, forKey: .user_id)
//        let companyValue = try values.decode(String.self, forKey: .company)
//        if (companyValue.isEmpty)
//            {company = ""}
//        else
//            {company = "companyValue"}
        email = try values.decode(String.self, forKey: .email)
        firstname = try values.decode(String.self, forKey: .firstname)
        lastname = try values.decode(String.self, forKey: .lastname)
    }
    
    
    init() {
    }
}

