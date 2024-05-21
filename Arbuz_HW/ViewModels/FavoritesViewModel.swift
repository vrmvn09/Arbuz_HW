//
//  FavoritesViewModel.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 21.05.2024.
//

import Foundation
import Combine

class FavoritesViewModel: ObservableObject {
    static let shared = FavoritesViewModel()
    
    @Published var favoriteProducts: [Product] = []
    
    func toggleFavorite(_ product: Product) {
        if isFavorite(product) {
            removeFavorite(product)
        } else {
            addFavorite(product)
        }
    }
    
    func isFavorite(_ product: Product) -> Bool {
        favoriteProducts.contains { $0.id == product.id }
    }
    
    private func addFavorite(_ product: Product) {
        favoriteProducts.append(product)
    }
    
    private func removeFavorite(_ product: Product) {
        favoriteProducts.removeAll { $0.id == product.id }
    }
}


func mockData() -> Product {
    return Product(
        id: UUID(),
        name: "Банан",
        imageName: "banana",
        price: 1200,
        description: "Банан - это популярный фрукт с яркой желтой кожурой и мягким белесым мякотью. Бананы обладают сладким вкусом и кремовой текстурой, что делает их вкусным и питательным угощением.",
        itemsCount: 5,
        backgroundColor: "yellow",
        productType: "Фрукты",
        categoryType: "Свежие фрукты"
    )
}
