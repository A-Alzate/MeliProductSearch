//
//  DetailView.swift
//  Meli
//
//  Created by Alejandro Alzate Zapata on 11/11/24.
//

import SwiftUI

struct DetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            Text(product.title)
                .font(.title)
            Divider()
            let imageUrl = product.thumbnail.replacing("http:", with: "https:")
            AsyncImage(url: URL(string: imageUrl)) { phase in
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
            Divider()
            Text(formatToCOP(product.price))
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title2)
            Spacer()
            Button(action: {
                print("Comprar \(product.title)")
            }) {
                Text(Strings.Detail.buyNowButtonTitle)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Button(action: {
                print("Agregar al carrito \(product.title)")
            }) {
                Text(Strings.Detail.addToCartButtonTitle)
                    .font(.headline)
                    .foregroundColor(Color.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.secondary)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(20)
    }
    
    private func formatToCOP(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "COP"
        formatter.maximumFractionDigits = 0

        return formatter.string(from: NSNumber(value: value)) ?? "$0"
    }
}

#Preview {
    DetailView(product: Product(
        id: "MCO2707035890",
        title: "Celular Moto G04s 128gb Negro",
        price: 509639,
        currencyId: "COP",
        thumbnail:             "https://http2.mlstatic.com/D_679639-CBT80375284663_112024-I.jpg"
)
    )
}
