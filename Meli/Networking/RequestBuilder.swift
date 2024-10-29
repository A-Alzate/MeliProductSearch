//
//  RequestBuilder.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 25/10/24.
//

import Foundation

enum MethodType: String {
    case get
    case post
    case put
    case delete
}

class RequestBuilder {
    private let baseURL = "https://api.mercadolibre.com"
    private var request: URLRequest?
    
    func url(_ url: String) -> RequestBuilder {
        if let url = URL(string: "\(baseURL)\(url)") {
            self.request = URLRequest(url: url)
            self.request?.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        }
        return self
    }
    
    func body(_ body: Codable) -> RequestBuilder {
        guard let body = try? JSONEncoder().encode(body) else {
            return self
        }
        request?.httpBody = body
        return self
    }
    
    func method(_ method: MethodType) -> RequestBuilder {
        request?.httpMethod = method.rawValue.uppercased()
        return self
    }
    
    func build() -> URLRequest? {
        return request
    }
}
