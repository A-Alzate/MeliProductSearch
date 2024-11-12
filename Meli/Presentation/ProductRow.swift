//
//  ProductRow.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 29/10/24.
//

import SwiftUI

struct ProductRow: View {
    var product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.thumbnail)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Color.gray
                default:
                    ProgressView()
                }
                
            }
            .frame(width: 128, height: 128)
            .clipShape(.rect(cornerRadius: 25))
            
            Text(product.title)
        }
    }
}

#Preview {
    ProductRow(product: Product(id: "id", title: "Example", price: 10, currencyId: "COP", thumbnail: "https://http2.mlstatic.com/D_743052-MCO79992780906_102024-I.jpg"))
}
