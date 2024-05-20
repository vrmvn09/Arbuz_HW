//
//  File.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
}
