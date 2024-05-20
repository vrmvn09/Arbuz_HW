//
//  OnboardingView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    @State var toAction: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Image(Images.onboarding.rawValue)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                Spacer()
                VStack(alignment: .center, spacing: 21) {
                    Text("Покупайте продукты \nлегко с нами")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Подписка на еженедельную \nдоставку молочных продуктов,\n овощей и фруктов.")
                        .foregroundColor(.gray)
                }
                .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    isOnboarding = false
                }) {
                    MainButton(title: "Начать покупку", color: .mainGreenColor)
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Arbuz")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
