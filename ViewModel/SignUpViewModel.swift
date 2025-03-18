//
//  SignUpViewModel.swift
//  Auth Module
//
//  Created by apple on 27/02/2025.
//



import Foundation

class SignUpViewModel: ObservableObject {
    
    private let userDefaultsManager = UserDefaultsManager.shared
    
        @Published var userName: String = ""
        @Published var email: String = ""
        @Published var password: String = ""


    // Method to handle sign-up and store data in UserDefaults
    func signUpUser() {
        guard !userName.isEmpty, !email.isEmpty, !password.isEmpty else {
            print("Missing information!")
            return
        }
        
        
            // Save data using the UserDefaultsManager singleton
            userDefaultsManager.saveUserName(userName)
            userDefaultsManager.saveEmail(email)
            userDefaultsManager.savePassword(password)
            
            print("User signed up successfully!")
        }
    
    
    func signInUser() {
            print("Sign In Tapped")
            return
        }
        
    }

