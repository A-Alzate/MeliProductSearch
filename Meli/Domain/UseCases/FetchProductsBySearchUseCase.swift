//
//  FetchProductsBySearchUseCase.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import Foundation

class FetchProductsBySearchUseCase {
    let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol) {
        self.repository = repository
    }
    
    func exec(text: String) async throws -> [Product] {
        return try await repository.fetchProductBySearch(text: text)
    }
}
