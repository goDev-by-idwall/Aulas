//
//  Personality.swift
//  Aula 9
//
//  Created by Felipe Brigagão de Almeida on 21/03/22.
//

import Foundation

struct Personality: Codable {
    let id: Int
    let name: String
    let photo: String
    let companies: Company
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case photo = "photo"
        case companies = "company"
    }
}

struct Company: Codable {
    let name: String
}
