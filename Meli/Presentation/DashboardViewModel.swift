//
//  DashboardViewModel.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 28/10/24.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var fetchProductsBySearchUseCase: FetchProductsBySearchUseCase
    
    init(fetchProductsBySearchUseCase: FetchProductsBySearchUseCase) {
        self.fetchProductsBySearchUseCase = fetchProductsBySearchUseCase
    }
    
    @MainActor
    func fetchProducts(text: String) {        
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let response = try await fetchProductsBySearchUseCase.exec(text: text)
                self.products = response
            } catch (let error) {
                self.errorMessage = "Error"
            }
        }
    }
}
