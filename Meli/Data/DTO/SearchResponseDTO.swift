//
//  SearchResponseDTO.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 28/10/24.
//

import Foundation

struct SearchResponseDTO: Codable, Equatable {
    let siteId: String
    let query: String
    let results: [ProductDTO]
    
    enum CodingKeys: String, CodingKey {
        case query, results
        case siteId = "site_id"
    }
}
