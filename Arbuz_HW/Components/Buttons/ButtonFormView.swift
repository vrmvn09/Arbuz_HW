//
//  ButtonFormView.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct ButtonFormView: View {
    
    typealias ButtonActionHandler = (_ formId: FormField) -> Void
    
    let component: ButtonFormComponent
    let handler: ButtonActionHandler
    
    init(component: ButtonFormComponent, handler: @escaping ButtonFormView.ButtonActionHandler) {
        self.component = component
        self.handler = handler
    }
    
    var body: some View {
        Button {
            handler(component.formId)
        } label: {
            VStack {
                HStack {
                    Spacer()
                    Text(component.title)
                        .fontWeight(.medium)
                    Spacer()
                }
                .padding(.vertical, 15)
            }
            .foregroundColor(.white)
            .background(Color(Colors.mainGreenColor.rawValue))
            .cornerRadius(20)
        }
    }
}

struct ButtonFormView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFormView(component: .init(id: .submit, title: "title")) { _ in }
    }
}

