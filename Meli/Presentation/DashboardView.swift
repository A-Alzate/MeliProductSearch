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
                    if newValue.count > 3 {
                        viewModel.fetchProducts(text: newValue)
                    }
                }
            
            List(viewModel.products) { product in
                Text(product.title)
            }.listStyle(.plain)
            
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
