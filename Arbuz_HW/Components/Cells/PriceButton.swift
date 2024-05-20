//
//  PriceButton.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct PriceButton: View {
    var title: String
    var color: String
    
    var body: some View {
        VStack{
            Text(title)
        }
        .padding(8)
        .background(Color(color))
        .cornerRadius(10)
    }
}

struct PriceButton_Previews: PreviewProvider {
    static var previews: some View {
        PriceButton(title: "1111", color: Colors.lightGreen.rawValue)
    }
}
