//
//  RequestBuilderTest.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 26/10/24.
//

import XCTest
@testable import Meli

class RequestBuilderTest: XCTestCase {
    
    var builder: RequestBuilder!
    
    override func setUp() {
        super.setUp()
        builder = RequestBuilder()
    }
    
    override func tearDown() {
        builder = nil
        super.tearDown()
    }
    
    func testBuilder_WhenHaveAEmptyURL_ReturnBaseUrlSuccess() {
        //Given
        let requestBuilder = builder.url("")
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com")
    }
    
    func testBuilder_WhenHaveAValidURL_ReturnFullUrlSuccess() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search")
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
    }
    
    func testBuilder_WhenHaveAEmptyHeaders_ReturnDefaultHeaderSuccess() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search")
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
        XCTAssertEqual(request?.allHTTPHeaderFields, ["Content-Type": "Application/json"])
    }
    
    func testBuilder_WhenAddABody_ReturnAllHeadersSuccess() {
        //Given
        let bodyModel = ProductDTO(id: "id", title: "title", price: 10, currencyId: "COP", thumbnail: "image")
        let requestBuilder = builder.url("/sites/MLA/search").body(bodyModel)
        //When
        let request = requestBuilder.build()
        //Then
        let bodyResponse = try? JSONDecoder().decode(ProductDTO.self, from: (request?.httpBody)!)
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
        XCTAssertEqual(request?.allHTTPHeaderFields, ["Content-Type": "Application/json"])
        XCTAssertEqual(bodyResponse, bodyModel)
    }
    
    func testBuilder_WhenHaveAEmptyMethod_ReturnGetMethodSuccess() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search")
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
        XCTAssertEqual(request?.httpMethod, "GET")
    }
    
    func testBuilder_WhenHaveMethodTypePOST_ReturnPOSTMethodSuccess() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search").method(.post)
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
        XCTAssertEqual(request?.httpMethod, "POST")
    }
    
    func testBuilder_WhenHaveMethodTypePUT_ReturnPUTMethodSuccess() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search").method(.put)
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
        XCTAssertEqual(request?.httpMethod, "PUT")
    }
    
    func testBuilder_WhenHaveMethodTypeDELETE_ReturnDELETEMethodSuccess() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search").method(.delete)
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertEqual(request?.url?.absoluteString, "https://api.mercadolibre.com/sites/MLA/search")
        XCTAssertEqual(request?.httpMethod, "DELETE")
    }
    
    func testBuilder_WhenBuild_ReturnURLRequest() {
        //Given
        let requestBuilder = builder.url("/sites/MLA/search")
        //When
        let request = requestBuilder.build()
        //Then
        XCTAssertNotNil(request)
    }
}
