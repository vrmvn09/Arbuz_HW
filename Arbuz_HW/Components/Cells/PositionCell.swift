//
//  PositionCell.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct PositionCell: View {
    @StateObject var viewModel: CartViewModel
    @State var count: Int
    let position: Position
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack(spacing: 4) {
            VStack(alignment: .center) {
                Image(position.product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
            .padding(.leading, 10)
            Spacer()
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("\(position.product.name)")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Button(action: {
                                // Handle deletion here
                                CartViewModel.shared.positions.removeAll { $0.id == position.id }
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.title3)
                                    .padding(.trailing, 12)
                            }
                        }
                        .padding(.top, 12)
                        HStack {
                            if position.product.productType == ProductType.dairy.rawValue {
                                Text("\(position.count)шт x \(position.product.price) тг")
                                    .font(.caption)
                                    .foregroundColor(Color.secondary)
                            } else {
                                Text("\(position.count)кг x \(position.product.price) тг")
                                    .font(.caption)
                                    .foregroundColor(Color.secondary)
                            }
                            Spacer()
                        }
                        HStack {
                            VStack {
                                Spacer()
                                Text("\(position.cost) тг")
                                    .foregroundColor(Color.secondary)
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            VStack {
                                Spacer()
                                HStack {
                                    Button(action: {
                                        if count > 0 {
                                            count -= 1
                                            if count == 0 {
                                                CartViewModel.shared.positions.removeAll { $0.id == position.id }
                                            }
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .foregroundColor(.red)
                                            .font(.title3)
                                            .padding(.leading, 8)
                                    }
                                    Text("\(count) x \(position.product.price)")
                                        .font(.title3)
                                        .frame(width: 100)
                                    Button(action: {
                                        if count < position.product.itemsCount {
                                            count += 1
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                            .foregroundColor(.green)
                                            .font(.title3)
                                            .padding(.trailing, 8)
                                    }
                                }
                                .padding(4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.black, lineWidth: 0.5)
                                )
                                .padding(.trailing, 8)
                            }
                        }
                        .padding(.bottom, 12)
                    }
                }
            }
        }
        .frame(height: 100)
        .background(Color(Colors.lightGray.rawValue))
        .cornerRadius(16)
        .onAppear {
            count = position.count
        }
        .onChange(of: count) { newCount in
            let newPosition = Position(product: position.product, count: newCount)
            CartViewModel.shared.updatePosition(newPosition)
        }
    }
}

