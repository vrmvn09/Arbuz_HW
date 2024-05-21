//
//  ProductCard.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 21.05.2024.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
                    Image(product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, idealHeight: 120) 
                        .clipped()
                        .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(2)
                
                Text("\(product.price) тг")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding([.horizontal, .bottom])
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        )
        .padding(.bottom, 8)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product(name: "Бананы", imageName: "banana", price: 1200, description: "", itemsCount: 1, backgroundColor: "", productType: "Молочные продукты", categoryType: ""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

