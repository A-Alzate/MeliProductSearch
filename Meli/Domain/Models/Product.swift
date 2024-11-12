//
//  Product.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import Foundation

struct Product: Hashable, Identifiable {
    let id: String
    let title: String
    let price: Double
    let currencyId: String
    let thumbnail: String
}
