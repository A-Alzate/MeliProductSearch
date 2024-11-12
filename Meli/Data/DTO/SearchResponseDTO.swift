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
    let products: [ProductDTO]
    let paging: PagingDTO
    
    enum CodingKeys: String, CodingKey {
        case query, paging
        case siteId = "site_id"
        case products = "results"
    }
}

extension SearchResponseDTO {
    func dtoToModel() -> SearchResponse {
        return SearchResponse(products: products.map { $0.dtoToModel() }, paging: paging.dtoToModel())
    }
}
