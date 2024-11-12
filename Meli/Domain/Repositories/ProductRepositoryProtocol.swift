//
//  ProductRepositoryProtocol.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import Foundation

protocol ProductRepositoryProtocol {
    func fetchProductBySearch(text: String, offset: Int) async throws -> SearchResponse
}
