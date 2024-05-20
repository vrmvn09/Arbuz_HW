//
//  FormContentBuilder.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation
import Combine

enum FormState {
    case valid(user: User)
    case fail(error: ValidationError)
}

extension FormState: Equatable {
    static func == (lhs: FormState, rhs: FormState) -> Bool {
        switch (lhs, rhs) {
        case (.valid(user: let lhsType),
              .valid(user: let rhsType)):
            return lhsType == rhsType
        case (.fail(error: let lhsType),
              .fail(error: let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        default: return false
        }
    }
}

protocol FormContentBuilder {
    var content: [FormComponent] { get }
    var state: FormState? { get }
    func update(_ val: Any, in component: FormComponent)
    func validate()
}

final class FormContentBuilderImpl: ObservableObject, FormContentBuilder {
    @Published private(set) var state: FormState?

    private(set) var content: [FormComponent] = [
        
        TextFormComponent(id: .name,
                          placeholder: "Имя",
                          validations: [
                            
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.alphanumericRegex,
                                                  error: .custom(message: "Вводите только буквы"))
                                ]
                            )
                            
                          ]),
        TextFormComponent(id: .phoneNumber,
                          placeholder: "Номер телефона",
                          keyboardType: .phonePad,
                          validations: [
                            
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.phonenumber,
                                                  error: .custom(message: "Введите номер телефона, 11 символов")),
                                ]
                            )
                          ]),
        TextFormComponent(id: .address,
                          placeholder: "Адрес проживания",
                          keyboardType: .default,
                          validations: [
                            
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.address,
                                                  error: .custom(message: "Введите полный адрес"))
                                ]
                            )
                            
                          ]),
        TextFormComponent(id: .entrance,
                          placeholder: "Подъезд",
                          validations: [
                            
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.digitRegex,
                                                  error: .custom(message: "Введите цифру"))
                                ]
                            )
                            
                          ]),
        TextFormComponent(id: .floor,
                          placeholder: "Этаж",
                          validations: [
                            
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.digitRegex,
                                                  error: .custom(message: "Введите цифру"))
                                ]
                            )
                            
                          ]),
        TextFormComponent(id: .apartment,
                          placeholder: "Квартира",
                          keyboardType: .default,
                          validations: [
                            
                            RegexValidationManagerImpl(
                                [
                                    RegexFormItem(pattern: RegexPatterns.digitRegex,
                                                  error: .custom(message: "Введите цифру"))
                                ]
                            )
                            
                          ]),
        ButtonFormComponent(id: .submit,
                       title: "Оформить")
    ]
    func update(_ val: Any, in component: FormComponent) {
       
        guard let index = content.firstIndex(where: { $0.id == component.id }) else { return }
        content[index].val = val
   }
    
    func validate() {
        let formComponents = content
               .filter { $0.formId != .submit }
           
           for component in formComponents {
               
               for validator in component.validations {
                   
                   if let error = validator.validate(component.val as Any) {
                       self.state = .fail(error: error)
                       return
                   }
               }
           }
           
        if let name = formComponents.first(where: { $0.formId == .name})?.val as? String,
           let address = formComponents.first(where: { $0.formId == .address})?.val as? String,
           let phoneNumber = formComponents.first(where: { $0.formId == .phoneNumber})?.val as? String,
           let entrance = formComponents.first(where: { $0.formId == .entrance})?.val as? String,
           let floor = formComponents.first(where: { $0.formId == .floor})?.val as? String,
           let apartment = formComponents.first(where: { $0.formId == .apartment})?.val as? String{
           let newUser = User(name: name,
                               address: address,
                               phoneNumber: phoneNumber,
                               entrance: entrance,
                               floor: floor,
                               apartment: apartment)
               self.state = .valid(user: newUser)
           }
        else {
            print("dw")
        }
       }
   }

