//
//  ApiClientStub.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 27/10/24.
//

import Foundation
@testable import Meli

final class ApiClientStub: ApiClient {
    var returnSuccess: Bool = true
    
    func request<T>(request: URLRequest) async throws -> T where T : Decodable, T : Encodable {
        if returnSuccess {
            return ProductDTOFakeData.createData() as! T
        } else {
            throw BadRequest()
        }
    }
}
