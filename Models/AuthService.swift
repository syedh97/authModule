import Firebase
import FirebaseAuth
import GoogleSignIn
import SwiftUI

// AuthenticationError Enum
enum AuthenticationError: Error {
    case runtimeError(String)
}

class AuthService: ObservableObject {
    @Published var isUserAuthenticated = false
    @Published var isUserCreated = false
    @Published var signedInEmail: String = ""  // Add signed-in email for display

    // Regular Sign Up with Email & Password
    func regularCreateAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creating account: \(error.localizedDescription)")
                return
            }
            self.isUserCreated = true
            
            
            //self.isUserAuthenticated = true
            print("User created successfully with UID: \(result?.user.uid ?? "")")
        }
    }

    // Sign In with Email & Password
    func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
            self.signedInEmail = email
            self.isUserAuthenticated = true
            
            print("User signed in successfully with UID: \(result?.user.uid ?? "")")
            print("User signed in with email: \(email)")
        }
    }

    // Google Sign-In Integration
    @MainActor
    func signInWithGoogle() async throws {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Firebase clientID found")
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Get root view controller to present the Google Sign-In UI
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = scene.windows.first?.rootViewController else {
            fatalError("No root view controller!")
        }
        
        // Perform Google Sign-In and get the result
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        let user = result.user
        guard let idToken = user.idToken?.tokenString else {
            throw AuthenticationError.runtimeError("Google sign-in failed. No ID token found.")
        }
        
        // Firebase sign-in with Google credentials
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        let authResult = try await Auth.auth().signIn(with: credential)
        
        self.signedInEmail = authResult.user.email ?? ""
        self.isUserAuthenticated = true
        print("User signed in with Google, UID: \(authResult.user.uid)")
    }

    // Sign Out
    func signOut() async throws {
        do {
            try await GIDSignIn.sharedInstance.signOut()
            try Auth.auth().signOut()
            self.isUserAuthenticated = false
            self.signedInEmail = ""
            print("User signed out successfully.")
        } catch {
            print("Error signing out: \(error.localizedDescription)")
            throw error
        }
    }

    // Listen for auth state changes
    func listenForAuthStateChanges() {
        Auth.auth().addStateDidChangeListener { _, user in
            if user != nil {
                self.isUserAuthenticated = true
            } else {
                self.isUserAuthenticated = false
            }
        }
    }
}

