//
//  ProductDTO.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import Foundation

struct ProductDTO: Codable, Equatable {
    let id: String
    let title: String
    let price: Int
    let currencyId: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, thumbnail
        case currencyId = "currency_id"
    }
}

extension ProductDTO {
    func dtoToModel() -> Product {
        return Product(id: self.id, title: self.title, price: self.price, currencyId: self.currencyId, thumbnail: self.thumbnail)
    }
}
