//
//  SecondaryButton.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct SecondaryButton: View {
    let title: String
    let description: String
    let color: Colors
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.medium)
                    .padding(.leading, 12)
                Spacer()
                Text(description)
                    .fontWeight(.medium)
                    .padding(.trailing, 12)
            }
            .padding(.vertical, 15)
        }
        .foregroundColor(.white)
        .background(Color(color.rawValue))
        .cornerRadius(20)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "Начать покупку", description: "2500", color: .lightOrange)
    }
}

