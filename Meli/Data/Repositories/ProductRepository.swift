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
    
    func fetchProductBySearch(text: String, offset: Int) async throws -> SearchResponse {
        guard let request = requestBuilder.url("/sites/MCO/search?q=\(text)&offset=\(offset)").build() else {
            throw BadRequest()
        }
        
        let response: SearchResponseDTO = try await client.request(request: request)
        return response.dtoToModel()
    }
}

class BadRequest: Error {}
