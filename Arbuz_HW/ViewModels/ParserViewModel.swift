//
//  ParserViewModel.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

class ParserViewModel: ObservableObject {
    static let shared = ParserViewModel()
    @Published var products: [Product] = []
    @Published var fruits: [Product] = []
    @Published var vegetables: [Product] = []
    @Published var dairy: [Product] = []
    
    func fetchProducts(from jsonData: Data) {
            do {
                self.products = try JSONDecoder().decode([Product].self, from: jsonData)
       
            for product in self.products {
                switch product.productType {
                case "Фрукты":
                    self.fruits.append(product)
                case "Овощи":
                    self.vegetables.append(product)
                case "Молочные":
                    self.dairy.append(product)
                default:
                    self.dairy.append(product)
                }
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
    func groupProductsByCategory<T: CategorizedProduct>(products: [T]) -> [String: [T]] {
        let groupedByCategories = Dictionary(grouping: products, by: { $0.categoryType })
        return groupedByCategories
    }

}
protocol CategorizedProduct: Identifiable {
    var categoryType: String { get }
}
