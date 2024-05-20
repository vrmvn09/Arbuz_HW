//
//  TextFieldButton.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI

struct TextFieldButton: View {
    
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    @State private var text = ""
    @State private var error: ValidationError?
    
    let component: TextFormComponent

    var body: some View {
        VStack(alignment: .leading) {
            TextField(component.placeholder, text: $text)
                .keyboardType(component.keyboardType)
                .padding(10)
                .background(Color(Colors.lightGray.rawValue))
                .cornerRadius(20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(error == nil ? Color.secondary : Color.red)
                )
            Text(error?.errorDescription ?? "")
                .font(.caption)
                .foregroundColor(.red)
                .padding(.leading, 8)
        }
        .onChange(of: text, perform: { value in
            contentBuilder.update(text, in: component)
            error = component
                .validations
                .compactMap { $0.validate(text) }
                .first
        })
        .foregroundColor(.gray)
    }
}

struct TextFieldButton_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldButton(component: .init(id: .name, placeholder: "Place"))
            .environmentObject(FormContentBuilderImpl())
    }
}


