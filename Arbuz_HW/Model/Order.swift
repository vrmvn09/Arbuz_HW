//
//  Order.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

struct Orders: Identifiable {
    var id = UUID()
    var position: [Postion]
    var user: User
    var dayOfWeek: String
    var timeInterval: String
    var subscriptionPeriod: String
    
    var cost: Int {
        var totalcost: Int = 0
        for i in position {
            totalcost = totalcost * i.cost
        }
        return totalcost
    }
}
