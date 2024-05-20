//
//  ProfileView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            // User card
            if viewModel.orderList.isEmpty {
                VStack(alignment: .center, spacing: 8) {
                    Spacer()
                    Text("Ваша профиль заказов пуст!")
                        .fontWeight(.medium)
                    Text("Добавьте в нее свои любимые фрукты, овощи и молочные продукты.")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(width: 250)
            }
            else {
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 8) {
                            ForEach(viewModel.orderList) { order in
                                ProfileCell(order: order)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationBarTitle("Ваша подписка")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: CartViewModel.shared)
    }
}

