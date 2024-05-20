//
//  ProductTypeView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct ProductTypeView: View {
    @EnvironmentObject var viewModel: ParserViewModel
    var productType: [Product]
    @State var selectedProduct: Product? = nil
    @Environment(\.presentationMode) var presentationMode
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func headerView(categoryType: String) -> some View {
        HStack {
            Text(categoryType)
                .fontWeight(.medium)
            Spacer()
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(viewModel.groupProductsByCategory(products: productType).keys.sorted(by: { $0 < $1 }), id: \.self) { category in
                    Section(header: headerView(categoryType: category.description)) {
                        ForEach(viewModel.groupProductsByCategory(products: productType)[category]!, id: \.id) { item in
                            if item.itemsCount == 0 {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            else {
                                NavigationLink {
                                    ProductDetailView(viewModel: ProductDetailViewModel(product: item))
                                        .padding(.horizontal, 16)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.top, 6)
                        .padding(.bottom, 12)
                    }
                }
                .navigationBarTitle("Продукты")
            }
        }
    }
}

struct ProductTypeView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProducts: [Product] = [
            Product.mockData(),
            Product.mockData(),
            Product.mockData()
        ]
        
        return ProductTypeView(productType: sampleProducts)
            .environmentObject(ParserViewModel())
            .padding(16)
    }
}
