//
//  DashboardView.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 28/10/24.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel: DashboardViewModel
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Buscar...", text: $searchText)
                .padding(8)
                .background(Color.gray)
                .padding(.horizontal)
                .onChange(of: searchText) { oldValue, newValue in
                    searchText = newValue
                    viewModel.searchProducts(text: newValue)
                }
            
            if let products = viewModel.products?.enumerated().map({ $0 }) {
                List(products, id: \.element.id) { index, product in
                    Text("\(index)" + product.title)
                        .onAppear {
                            viewModel.fetchMoreProductIfNeeded(text: searchText, index: index + 1)
                        }
                }.overlay(content: {
                    if viewModel.isLoading {
                        ProgressView()
                    }
                })
                .listStyle(.plain)
            }
            
        }
        .padding()
        .navigationTitle("Buscador")
    }
}

#Preview {
    DashboardView(
        viewModel: DashboardViewModel(
            fetchProductsBySearchUseCase: FetchProductsBySearchUseCase(
                repository: ProductRepository(
                    requestBuilder: RequestBuilder(),
                    client: HTTPClient()
                )
            )
        )
    )
}
