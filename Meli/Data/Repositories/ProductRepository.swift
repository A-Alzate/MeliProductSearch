//
//  ProductRepository.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import Foundation

class ProductRepository: ProductRepositoryProtocol {
    let requestBuilder: RequestBuilder
    let client: ApiClient
    
    init(requestBuilder: RequestBuilder, client: ApiClient) {
        self.requestBuilder = requestBuilder
        self.client = client
    }
    
    func fetchProductBySearch(text: String) async throws -> [Product] {
        guard let request = requestBuilder.url("/sites/MLA/search?q=\(text)").build() else {
            throw BadRequest()
        }
        
        let response: SearchResponseDTO = try await client.request(request: request)
        let productsDto = response.results
        
        return productsDto.map { $0.dtoToModel() }
    }
}

class BadRequest: Error {}
