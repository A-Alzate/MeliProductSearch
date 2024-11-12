//
//  ProductRepositoryStub.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 27/10/24.
//

import Foundation
@testable import Meli

class ProductRepositoryStub: ProductRepositoryProtocol {
    var returnSuccess: Bool = true
    
    func fetchProductBySearch(text: String, offset: Int) async throws -> SearchResponse {
        if returnSuccess {
            return SearchResponseFakeData.createData()
        } else {
            throw BadRequest()
        }
    }
}
