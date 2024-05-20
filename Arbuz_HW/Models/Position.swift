//
//  Position.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

struct Position: Identifiable {
    var id = UUID()
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count
    }
}
