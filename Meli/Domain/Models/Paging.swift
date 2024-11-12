//
//  Paging.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 11/11/24.
//

import Foundation

struct Paging: Hashable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int
}
