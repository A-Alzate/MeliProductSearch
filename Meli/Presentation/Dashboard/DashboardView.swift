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
        NavigationStack {
            VStack {
                TextField(Strings.Dashboard.searchBarTitle, text: $searchText)
                    .padding(8)
                    .background(Color.gray.secondary)
                    .padding(.horizontal)
                    .onChange(of: searchText) { oldValue, newValue in
                        searchText = newValue
                        viewModel.searchProducts(text: newValue)
                    }
                
                if let products = viewModel.products?.enumerated().map({ $0 }) {
                    List(products, id: \.element.id) { index, product in
                        NavigationLink(destination: DetailView(product: product)) {
                            ProductRow(product: product)
                                .onAppear {
                                    viewModel.fetchMoreProductIfNeeded(text: searchText, index: index + 1)
                                }
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
            .navigationTitle(Strings.Dashboard.title)
        }
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
