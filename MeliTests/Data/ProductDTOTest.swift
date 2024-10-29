//
//  ProductDTOTest.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 27/10/24.
//

import XCTest
@testable import Meli

class ProductDTOTest: XCTestCase {
    
    func testDtoToModel_WhenTranslateObjectFromDTOToModel_ReturnSuccess() {
        //Given
        let productDTO = ProductDTO(id: "id_1", title: "title", price: 10, currencyId: "COP", thumbnail: "image")
        //When
        let model = productDTO.dtoToModel()
        //Then
        XCTAssertEqual(model.id, productDTO.id)
        XCTAssertEqual(model.title, productDTO.title)
        XCTAssertEqual(model.price, productDTO.price)
        XCTAssertEqual(model.currencyId, productDTO.currencyId)
        XCTAssertEqual(model.thumbnail, productDTO.thumbnail)
    }
}
