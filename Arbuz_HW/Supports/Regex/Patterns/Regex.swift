//
//  Regex.swift
//  Arbuz_HW
//
//  Created by Arman  Urstem on 20.05.2024.
//

import Foundation

enum RegexPatterns {
    static let phonenumber = "^\\+?\\d{11}$"
    static let address = "[А-Яа-я0-9,/]"
    static let digitRegex = "^[0-9]+$"
    static let alphanumericRegex = "[А-Яа-я]"
}

