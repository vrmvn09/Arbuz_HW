//
//  ProfileDetailView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct ProfileDetailView: View {
    var order: Orders
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Ваши продукты")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                ForEach(order.positions, id: \.id) { position in
                    ProfileProducCell(position: position)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Детали адреса")
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack(spacing: 16) {
                        Image(systemName: "mappin")
                        Text("\(order.user.address)")
                    }
                }
                VStack(spacing: 12) {
                    Text("Спасибо за подписку!")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Благодарим вас за доверие \n и возможность обеспечить вас свежими и вкусными молочными продуктами.")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .multilineTextAlignment(.center)
                .padding(.top, 50)
            }
        }
        .navigationBarTitle("Ваш заказ")
        .padding(.horizontal, 16)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(order: Orders(positions: [Position(product: Product.mockData(), count: 12)], user: User(name: "Meri", address: "Jmkfcjewfjo", phoneNumber: "123456", entrance: "3", floor: "4", apartment: "2"), dayOfWeek: "", timeInterval: "", subscriptionPeriod: ""))
    }
}
