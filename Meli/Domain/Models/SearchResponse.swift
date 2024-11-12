//
//  SearchResponse.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 11/11/24.
//

import Foundation

struct SearchResponse: Hashable {
    let products: [Product]
    let paging: Paging
}
