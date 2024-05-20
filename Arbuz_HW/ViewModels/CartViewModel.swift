//
//  CartViewModel.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    static let shared = CartViewModel()
    private init() {}
    
    @Published var positions = [Position]()
    @Published var user: User? = nil
    @Published var ordersList = [Orders]()
    @Published var dayOfWeek: String = ""
    @Published var timeInterval: String = ""
    @Published var subscriptionPeriod: String = ""
    
    var cost: Int {
        var sum = 0
        for pos in positions {
            sum = sum + pos.cost
        }
        return sum
    }
    
    func updatePosition(_ position: Position) {
        if let index = positions.firstIndex(where: { $0.product == position.product }) {
            positions[index] = position
        }
    }
    
    func position(for product: Product) -> Position? {
        return positions.first(where: { $0.product == product })
    }
    
    func addPosition(_ position: Position) {
        positions.append(position)
    }
    
    func removePosition(for product: Product) {
        positions.removeAll { $0.product == product }
    }
    
    func placeOrder(user: User, dayOfWeek: String, timeInterval: String, subscriptionPeriod: String) {
        guard !positions.isEmpty else {
            return
        }
        
        self.user = user
        self.dayOfWeek = dayOfWeek
        self.timeInterval = timeInterval
        self.subscriptionPeriod = subscriptionPeriod
        
        let order = Orders(positions: positions, user: user, dayOfWeek: dayOfWeek, timeInterval: timeInterval, subscriptionPeriod: subscriptionPeriod)
        ordersList.append(order)
        
        positions = []
        self.dayOfWeek = ""
        self.timeInterval = ""
        self.subscriptionPeriod = ""
    }
    
}
