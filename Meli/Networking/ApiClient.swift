//
//  ApiClient.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 25/10/24.
//

import Foundation

protocol ApiClient {
    func request<T: Codable>(request: URLRequest) async throws -> T
}

final class HTTPClient: ApiClient  {    
    func request<T: Codable>(request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, 
                response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }        
        
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
