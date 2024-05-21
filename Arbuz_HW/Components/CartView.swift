//
//  CartView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//


import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.positions.isEmpty {
                VStack(alignment: .center, spacing: 8) {
                    Spacer()
                    Text("Ваша корзина пустая!")
                        .fontWeight(.medium)
                    Text("Добавьте в нее свои любимые фрукты, овощи и молочные продукты.")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(width: 250)
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 8) {
                            ForEach(viewModel.positions, id: \.id) { position in
                                PositionCell(viewModel: CartViewModel.shared, count: position.count, position: position)
                            }
                        }
                        
                        if viewModel.cost < 8000 {
                            Text("Бесплатная доставка от 8000")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                                .padding([.horizontal, .top], 8)
                            
                        }
                        
                        VStack(spacing: 20) {
                            VStack(spacing: 20) {
                                HStack {
                                    Text("Итого")
                                    Spacer()
                                    Text("\(viewModel.cost) тг")
                                }
                                
                                HStack {
                                    Text("Доставка")
                                    Spacer()
                                    Text(viewModel.cost < 8000 ? "1000 тг" : "Бесплатно")
                                }
                                
                                HStack {
                                    Text("Общая сумма")
                                    Spacer()
                                    Text("\(viewModel.cost + (viewModel.cost < 8000 ? 1000 : 0)) тг")
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(Colors.lightGray.rawValue))
                            )
                            
                            HStack(spacing: 8) {
                                Button {
                                    viewModel.positions = []
                                } label: {
                                    MainButton(title: "Отменить", color: .mainGreenColor)
                                }
                                NavigationLink {
                                    OrderView(viewModel: CartViewModel.shared)
                                } label: {
                                    MainButton(title: "Заказать", color: .mainGreenColor)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .listStyle(.plain)
                    .navigationBarTitle("Корзина")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
