//
//  PagingDTO.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 11/11/24.
//

import Foundation

struct PagingDTO: Codable, Equatable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case total, offset, limit
        case primaryResults = "primary_results"
    }
}

extension PagingDTO {
    func dtoToModel() -> Paging {
        return Paging(total: total, primaryResults: primaryResults, offset: offset, limit: limit)
    }
}
