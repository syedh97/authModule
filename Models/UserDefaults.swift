//
//  UserDefaults.swift
//  Auth Module
//
//  Created by apple on 27/02/2025.
//


import Foundation

class UserDefaultsManager {
    
    // Shared instance for Singleton pattern
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    // Private init to ensure the singleton pattern
    private init() {}
    
    // Method to save the username
    func saveUserName(_ username: String) {
        defaults.set(username, forKey: "username")
    }
    
    // Method to retrieve the username
    func getUserName() -> String? {
        return defaults.string(forKey: "username")
    }
    
    // Method to save the email
    func saveEmail(_ email: String) {
        defaults.set(email, forKey: "email")
    }
    
    // Method to retrieve the email
    func getEmail() -> String? {
        return defaults.string(forKey: "email")
    }
    
    // Method to save the password
    func savePassword(_ password: String) {
        defaults.set(password, forKey: "password")
    }
    
    // Method to retrieve the password
    func getPassword() -> String? {
        return defaults.string(forKey: "password")
    }
    
    // Method to clear the stored user data
    func clearUserData() {
        defaults.removeObject(forKey: "username")
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "password")
    }
}
