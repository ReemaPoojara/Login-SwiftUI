//
//  LoginViewModel.swift
//  Login-SwiftUI
//
//  Created by Reema Poojara on 24/12/25.
//

import Foundation
import Combine

class LoginViewModel:ObservableObject {
    //Input
    @Published var email = ""
    @Published var password = ""
    
    //Output
    @Published var emailStatus:LoginValidationError = .success
    @Published var passwordStatus:LoginValidationError = .success
    @Published var isFormValid:Bool = false
    
    private let validationHelper = ValidationHelper()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupValidation()
    }
    func setupValidation() {
        $email
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [validationHelper] email in
                            validationHelper.validateEmail(email: email)
                        }
            .share()
            .assign(to: \.emailStatus,on: self)
            .store(in: &cancellables)
        
        $password
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [validationHelper] password in
                validationHelper.validatePassword(password: password)
            }
            .share()
            .assign(to: \.passwordStatus, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest($emailStatus, $passwordStatus)
            .map { emailSta , passwordSta in
                return emailSta == .success && passwordSta == .success
            }
            .assign(to: \.isFormValid,on: self)
            .store(in: &cancellables)
    }
    
}
