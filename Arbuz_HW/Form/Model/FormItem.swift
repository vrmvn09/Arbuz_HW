//
//  FormItem.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import SwiftUI
import Combine

protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var validations: [ValidationManager] { get }
    var val: Any? { get }
}

enum FormField {
    case name
    case phoneNumber
    case entrance
    case floor
    case apartment
    case address
    case submit
}

class FormComponent: FormItem, Identifiable {
    
    let id = UUID()
    let formId: FormField
    var validations: [ValidationManager]
    var val: Any?
    
    init(_ id: FormField, validations: [ValidationManager] = []) {
        self.formId = id
        self.validations = validations
    }
}

final class TextFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(id: FormField,
         placeholder: String,
         keyboardType: UIKeyboardType = .default,
         validations: [ValidationManager] = []
    ) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id, validations: validations)
    }
}

final class ButtonFormComponent: FormComponent {
    let title: String
    
    init(id: FormField, title: String) {
        self.title = title
        super.init(id)
    }
}


