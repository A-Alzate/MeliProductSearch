//
//  SearchResponseDTOFakeData.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 27/10/24.
//

import Foundation
@testable import Meli

final class SearchResponseDTOFakeData {
    static func createData() -> SearchResponseDTO {
        return SearchResponseDTO(
            siteId: "",
            query: "",
            products: [
                ProductDTO(id: "1", title: "Product 1", price: 10, currencyId: "COP", thumbnail: "image 1"),
                ProductDTO(id: "2", title: "Product 2", price: 20, currencyId: "COP", thumbnail: "image 2"),
                ProductDTO(id: "3", title: "Product 3", price: 30, currencyId: "COP", thumbnail: "image 3"),
                ProductDTO(id: "4", title: "Product 4", price: 40, currencyId: "COP", thumbnail: "image 4")
            ],
            paging: PagingDTO(total: 10, primaryResults: 10, offset: 0, limit: 10)
        )
    }
}
