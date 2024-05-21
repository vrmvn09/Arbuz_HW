//
//  FavoritesView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 21.05.2024.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel.shared
    
    var body: some View {
        NavigationView {
            if viewModel.favoriteProducts.isEmpty {
                VStack(alignment: .center, spacing: 8) {
                    Spacer()
                    Text("Ваш список избранных продуктов пуст!")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                    Text("Добавьте в него свои любимые продукты, чтобы они всегда были под рукой.")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(width: 250)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.favoriteProducts, id: \.id) { product in
                            NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: product)).padding()) {
                                ProductCard(product: product)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.top)
                }
                .navigationTitle("Избранное")
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
