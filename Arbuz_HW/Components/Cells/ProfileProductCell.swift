//
//  ProfileProductCell.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation
import SwiftUI

struct ProfileProducCell: View {
    let position: Position
    
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
                        }
                        .padding(.bottom, 12)
                    }
                }
            }
        }
        .frame(height: 100)
        .background(Color(Colors.lightGray.rawValue))
        .cornerRadius(16)

    }
}

struct ProfileProducCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileProducCell(position: Position(product: Product.mockData(), count: 12))
    }
}

