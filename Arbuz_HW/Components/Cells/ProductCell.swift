//
//  ProductCell.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct ProductCell: View {
    var product: Product
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 6) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.top, 16)
                    .padding(8)
                HStack {
                    Text("\(product.name)")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .frame(height: 40, alignment: .top)
                if product.productType == ProductType.dairy.rawValue {
                    Text("\(product.price)тг/ 1шт")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
                else {
                    Text("\(product.price)тг/ 1кг")
                        .font(.caption)
                        .foregroundColor(Color.secondary)
                }
            }
            .padding(.horizontal, 8)
            if product.itemsCount == 0 {
                VStack(alignment: .center) {
                    Text("Нет в наличии")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.red.opacity(0.7))
                        .lineLimit(1)
                }
                .padding(2)
                .background(
                    Color.white
                        .opacity(0.9)
                        .cornerRadius(12)
                )
                .cornerRadius(12)
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            }
            else {
                VStack(alignment: .center) {
                    Text("\(product.price) тг")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                }
                .padding(3)
                .background(
                    Color.white
                        .opacity(0.9)
                        .cornerRadius(12)
                )
                .cornerRadius(12)
                .padding(.horizontal, 4)
                .padding(.bottom, 4)
            }
        }
        .background(product.itemsCount == 0 ? Color(Colors.lightGray.rawValue) : Color(product.backgroundColor))
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(name: "Бананы БананыБананыБананы", imageName: "banana", price: 19087, description: "", itemsCount: 0, backgroundColor: "lightGreen", productType: "Молочные продукты", categoryType: "")).edgesIgnoringSafeArea(.all)
    }
}

