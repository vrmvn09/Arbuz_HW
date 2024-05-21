//
//  BottomNavigationBar.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct BottomNavigationBar: View {
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Главная")
                    }
                
                CartView(viewModel: CartViewModel.shared)
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                
                FavoritesView() 
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Избранное")
                    }
                
                ProfileView(viewModel: CartViewModel.shared)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Профиль")
                    }
            }
        }
        .accentColor(Color.green)
        .onAppear {
            if let jsonData = JSONLoader.loadJSONData(from: "ProductJSON") {
                ParserViewModel.shared.fetchProducts(from: jsonData)
            } else {
                print("Failed to load JSON file.")
            }
        }
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar()
            .environmentObject(ParserViewModel())
    }
}
