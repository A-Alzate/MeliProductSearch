//
//  FetchProductsBySearchUseCaseTest.swift
//  MeliTests
//
//  Created by Alejandro Alzate Zapata on 27/10/24.
//

import XCTest
@testable import Meli

class FetchProductsBySearchUseCaseTest: XCTestCase {
    var sut: FetchProductsBySearchUseCase!
    var repositoryStub: ProductRepositoryStub!
    
    override func setUp() {
        super.setUp()
        repositoryStub = ProductRepositoryStub()
        sut = FetchProductsBySearchUseCase(repository: repositoryStub)
    }
    
    override func tearDown() {
        repositoryStub = nil
        sut = nil
        super.tearDown()
    }
    
    func testUseCase_WhenExecFetchProductBySearch_ReturnSuccess() async {
        //Given
        repositoryStub.returnSuccess = true
        //When
        let products = try? await sut.exec(text: "test")
        //Then
        XCTAssertEqual(products?.count, ProductFakeData.createData().count)
        XCTAssertEqual(products, ProductFakeData.createData())
    }
    
    func testUseCase_WhenExecFetchProductBySearch_ThrowsError() async {
        //Given
        repositoryStub.returnSuccess = false
        //When
        let products = try? await sut.exec(text: "test")
        //Then
        XCTAssertNil(products)
    }
}
