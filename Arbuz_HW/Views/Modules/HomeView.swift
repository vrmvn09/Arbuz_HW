//
//  HomeView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ParserViewModel.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    NavigationLink {
                        ProductTypeView(productType: viewModel.fruits)
                            .padding(.horizontal, 16)
                    } label: {
                        CategoryCard(title: "Фрукты", imageStr: Images.fruitsMainPhoto.rawValue, color: Colors.lightYellow.rawValue)
                    }
                    NavigationLink {
                        ProductTypeView(productType: viewModel.vegetables)
                            .padding(.horizontal, 16)
                    } label: {
                        CategoryCard(title: "Овощи", imageStr: Images.vegetablesMainPhoto.rawValue, color: Colors.lightGreen.rawValue)
                    }
                    NavigationLink {
                        ProductTypeView(productType: viewModel.dairy)
                            .padding(.horizontal, 16)
                    } label: {
                        CategoryCard(title: "Молочные продукты", imageStr: Images.dairyMainPhoto.rawValue, color: Colors.lightGray.rawValue)
                    }
                }
                .foregroundColor(.black)
            }
            .navigationBarTitle("Arbuz_HW")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

