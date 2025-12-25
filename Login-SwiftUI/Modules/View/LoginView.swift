//
//  ContentView.swift
//  Login-SwiftUI
//
//  Created by Reema Poojara on 23/12/25.
//

import SwiftUI

// //            Text(Environment.apiKey)
//            Text(Environment.rootURL.absoluteString)


struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color(.orange)
                .ignoresSafeArea()
           
            VStack(spacing: 30) {
                    //Email text Field
                TextField("Enter user name",text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(viewModel.emailStatus == .success ? Color.clear: Color.red,lineWidth: 1)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                        )
                // Show message if not success
                
                if case .emptyEmail(let msg) = viewModel.emailStatus {
                                Text(msg).foregroundColor(.red)
                }
                if case .invalidEmail(let msg) = viewModel.emailStatus {
                    Text(msg).foregroundColor(.red)
                }
              
                
                //Password text field
                SecureField("Enter your password", text: $viewModel.password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
               //Login button
              //  padding(.bottom,10)
                Button {
                    print("Login Tapped")
                } label: {
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity) // Makes it full width
                        .padding()
                        .background(Color.blue)
                        .clipShape(.capsule)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                }

               //Sign Up button
                Button {
                    print("Sign up Tapped")
                } label: {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color(.blue))
                        .clipShape(.capsule)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                }
            }
            
        }
    }
    // 1. State properties to store user input
   /* @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // 2. Full screen background color
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Header
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                
                // 3. Email TextField
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("example@test.com", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                }
                
                // 4. Password SecureField
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                }
                
                // 5. Login Button
                Button(action: {
                    print("Logging in with: \(email)")
                }) {
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                
                // 6. Sign Up Button
                Button(action: {
                    print("Navigate to Sign Up")
                }) {
                    Text("Don't have an account? Sign Up")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 50)
        }
    }*/
}

#Preview {
    LoginView()
}
