//
//  OrderVIew.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    let viewModel: CartViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var dayOfWeek: String = ""
    @State private var timeInterval: String = ""
    @State private var subscriptionPeriod: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Выбрать день недели:")
                            .modifier(optionModifier())
                        Picker("Выбрать день недели", selection: $dayOfWeek) {
                            ForEach(OptionsToConfirm.optionsDayOfWeek, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                    .padding(.top, 20)
                    VStack(alignment: .leading) {
                        Text("Выбрать период времени")
                            .modifier(optionModifier())
                        Picker("Выбрать день недели", selection: $dayOfWeek) {
                            ForEach(OptionsToConfirm.optionsTimeInterval, id: \.self) { option in
                                Text(option)
                            }
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("Указать данные")
                        .modifier(optionModifier())
                    ForEach(contentBuilder.content) { component in
                        switch component {
                        case is TextFormComponent:
                            TextFieldButton(component: component as! TextFormComponent)
                                .environmentObject(contentBuilder)
                        default:
                            Text("")
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("Период подписки")
                        .modifier(optionModifier())
                    Picker("Выбрать день недели", selection: $dayOfWeek) {
                        ForEach(OptionsToConfirm.optionsSubscriptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    ForEach(contentBuilder.content) { component in
                        switch component {
                        case is ButtonFormComponent:
                            ButtonFormView(component: component as! ButtonFormComponent) { id in
                                switch id {
                                case .submit:
                                    contentBuilder.validate()
                                default:
                                    break
                                }
                            }
                        default:
                            Text("")
                        }
                    }
                }
            }
            .navigationBarTitle("Оформление заказа")
            .onChange(of: contentBuilder.state ){ state in
                switch state {
                case .valid(let user):
                    print(user)
                    print("SUCC")
                    viewModel.placeOrder(user: user, dayOfWeek: dayOfWeek, timeInterval: timeInterval, subscriptionPeriod: subscriptionPeriod)
                    presentationMode.wrappedValue.dismiss()
                case .fail(_):
                    print("fail")
                case .none:
                    break
                }
            }
            .padding(.horizontal, 16)
        }
    }
    struct optionModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: CartViewModel.shared)
    }
}

