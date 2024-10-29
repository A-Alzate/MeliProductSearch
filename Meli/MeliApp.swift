//
//  MeliApp.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 25/10/24.
//

import SwiftUI

@main
struct MeliApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView(viewModel: DashboardViewModel(fetchProductsBySearchUseCase: FetchProductsBySearchUseCase(repository: ProductRepository(requestBuilder: RequestBuilder(), client: HTTPClient()))) )
        }
    }
}
