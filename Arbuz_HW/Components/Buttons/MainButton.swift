//
//  MainButton.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct MainButton: View {
    let title: String
    let color: Colors
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(title)
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.vertical, 15)
        }
        .foregroundColor(.white)
        .background(Color(color.rawValue))
        .cornerRadius(20)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Начать покупку", color: .lightOrange)
    }
}

