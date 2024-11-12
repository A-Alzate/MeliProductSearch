//
//  DashboardViewModel.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 28/10/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var products: [Product]? = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private var paging: Paging? = nil
    
    private var fetchProductsBySearchUseCase: FetchProductsBySearchUseCase
    
    init(fetchProductsBySearchUseCase: FetchProductsBySearchUseCase) {
        self.fetchProductsBySearchUseCase = fetchProductsBySearchUseCase
    }
    
    @MainActor
    func searchProducts(text: String) {
        Task {
            do {
                let response = try await fetchProducts(text: text, offset: 0)
                self.products = response.products
                self.paging = response.paging
            } catch (let error) {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func fetchMoreProductIfNeeded(text: String, index: Int) {
        Task {
            do {
                try validateIfNeeded(index: index)
                let response = try await fetchProductsBySearchUseCase.exec(text: text, offset: products?.count ?? 0)
                self.products?.append(contentsOf: response.products)
            } catch (let error) {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func fetchProducts(text: String, offset: Int) async throws -> SearchResponse {
        try validateSearch(text: text)
        isLoading = true
        errorMessage = nil
        let response = try await fetchProductsBySearchUseCase.exec(text: text, offset: offset)
        self.isLoading = false
        return response
    }
    
    private func validateIfNeeded(index: Int) throws {
        if index != products?.count {
            throw Exceptions.notNeeded
        }
    }
    
    private func validateSearch(text: String) throws {
        if text.isEmpty || text.count < 3 {
            throw Exceptions.shortSearch
        }
    }
}

enum Exceptions: Error {
    case shortSearch
    case notNeeded
}
