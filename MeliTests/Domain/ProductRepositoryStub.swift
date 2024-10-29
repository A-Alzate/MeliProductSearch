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
    
    func fetchProductBySearch(text: String) async throws -> [Product] {
        if returnSuccess {
            return ProductFakeData.createData()
        } else {
            throw BadRequest()
        }
    }
}
