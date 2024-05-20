//
//  Category.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct CategoryCard: View {
    let title: String
    let imageStr: String
    let color: String
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(20)
            Spacer()
        }
        .frame(height: 135)
        .background(Color(color))
            .overlay(content: {
            Image(imageStr)
                .resizable()
                .scaledToFill()
        })
        .cornerRadius(20)
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(title: "Фрукты", imageStr: "fruitsMainPhoto", color: Colors.lightGray.rawValue)
    }
}

