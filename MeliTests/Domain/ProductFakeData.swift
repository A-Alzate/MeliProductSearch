//
//  ProductFakeData.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 27/10/24.
//

import Foundation
@testable import Meli

class ProductFakeData {
    static func createData() -> [Product] {
        return [
            Product(id: "1", title: "Product 1", price: 10, currencyId: "COP", thumbnail: "image 1"),
            Product(id: "2", title: "Product 2", price: 20, currencyId: "COP", thumbnail: "image 2"),
            Product(id: "3", title: "Product 3", price: 30, currencyId: "COP", thumbnail: "image 3"),
            Product(id: "4", title: "Product 4", price: 40, currencyId: "COP", thumbnail: "image 4")
        ]
    }
}
