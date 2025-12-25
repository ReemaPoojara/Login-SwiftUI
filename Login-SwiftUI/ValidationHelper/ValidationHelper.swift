//
//  ValidationHelper.swift
//  Login-SwiftUI
//
//  Created by Reema Poojara on 24/12/25.
//

import Foundation

struct ValidationHelper {
    
    func validateEmail(email:String?) -> LoginValidationError {
        guard let email = email?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            return .emptyEmail(Constant.ErrorMessage.emptyEmail)
        }
        
        guard email.isValidEmail else {
            return .invalidEmail(Constant.ErrorMessage.invalidEmail)
        }
        return .success
    }
    func validatePassword(password:String?) -> LoginValidationError {
        guard let password = password, !password.isEmpty else {
            return .emptyPassword(Constant.ErrorMessage.emptyPassword)
        }
        guard password.count > 8 else {
            return .passwordLength(Constant.ErrorMessage.invalidPassword)
        }
        return .success
    }
    
    func validateLogin(email:String?,password:String?) -> LoginValidationError {
        let emailValidation = validateEmail(email: email)
        let passwordValidation = validatePassword(password: password)
        
        if  emailValidation != .success {
            return emailValidation
        } else if passwordValidation != .success {
            return passwordValidation
        }
        return .success
    }
}
