//
//  Product.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

struct Product: Codable, Hashable {
    var id = UUID()
    let name: String
    let imageName: String
    let price: Int
    let description: String
    let itemsCount: Int
    let backgroundColor: String
    let productType: String
    let categoryType: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName
        case price
        case description
        case itemsCount
        case backgroundColor
        case productType
        case categoryType
    }
    static func mockData() -> Product {
        return  .init(name: "Бананы",
                      imageName: "banana",
                      price: 1200,
                      description: "",
                      itemsCount: 20,
                      backgroundColor: "lightYellow",
                      productType: "Фрукты",
                      categoryType: "Бананы")
    }
}
