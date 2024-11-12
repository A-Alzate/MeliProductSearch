//
//  ProductRepositoryTest.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import XCTest
@testable import Meli

class ProductRepositoryTest: XCTestCase {
    var sut: ProductRepositoryProtocol!
    var requestBuilder: RequestBuilder!
    var apiClient: ApiClientStub!
    
    override func setUp() {
        super.setUp()
        requestBuilder = RequestBuilder()
        apiClient = ApiClientStub()
        sut = ProductRepository(requestBuilder: requestBuilder, client: apiClient)
    }
    
    override func tearDown() {
        requestBuilder = nil
        apiClient = nil
        super.tearDown()
    }
    
    func testFetchProduct_WhenSearchBytext_ReturnSuccess() async {
        //Given
        apiClient.returnSuccess = true
        //When
        let response = try? await sut.fetchProductBySearch(text: "example", offset: 0)
        //Then
        XCTAssertEqual(response?.products.count, 4)
    }
    
    func testFetchProduct_WhenSearchBytext_ThrowsError() async {
        //Given
        apiClient.returnSuccess = false
        //When
        let products = try? await sut.fetchProductBySearch(text: "example", offset: 0)
        //Then
        XCTAssertNil(products)
    }
}
