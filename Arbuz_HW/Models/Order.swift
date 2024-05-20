//
//  Order.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

struct Orders: Identifiable {
    var id = UUID()
    let positions: [Position]
    let user: User
    let dayOfWeek: String
    let timeInterval: String
    let subscriptionPeriod: String
    
    var cost: Int {
        var totalCost: Int = 0
        for i in positions {
            totalCost = totalCost + i.cost
        }
        return totalCost
    }
}
