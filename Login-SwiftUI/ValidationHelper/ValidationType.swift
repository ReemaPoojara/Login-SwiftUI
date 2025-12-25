//
//  ValidationType.swift
//  Login-SwiftUI
//
//  Created by Reema Poojara on 24/12/25.
//

import Foundation

enum LoginValidationError :Equatable {
    case emptyEmail(String)
    case invalidEmail(String)
    case emptyPassword(String)
    case passwordLength(String)
    case success
}
