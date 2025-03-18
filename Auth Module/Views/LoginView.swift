import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @EnvironmentObject var authService: AuthService
    @StateObject private var viewModel = SignUpViewModel()
    @State private var navigateToHomeView = false
    @Environment(\.dismiss) private var dismiss// Control the navigation to HomeView
    
    var body: some View {
        ZStack {
            BackGround()
            VStack {
                Image("logoimg2")
                
                Text("Welcome Back")
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundColor(.white)
                
                Text("Enter your credentials to access My Mufti")
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 12) {
                    FieldsView(username: $viewModel.email, imageicon: "Letter", Labeltxt: "Email:")
                    
                PasswordField(password: $viewModel.password, placeholder: "Enter Your Password", imageicon: "Eye")
                    
                    HStack {
                        Spacer()
                        Text("Forgot Password? ")
                            .font(.system(size: 12))
                            .foregroundColor(.lightcolor)
                    }
                    .frame(width: 343, height: 20)
                    
                    SocialView(action: {
                        // Sign in user and navigate only after successful login
                      if authService.signInUser(email: viewModel.email, password: viewModel.password){
                            
                            //Resetting email and passowrd fields once logged in
                            viewModel.email = ""
                            viewModel.password = ""
                        }
                    }, btntext: "Sign In")
                    
                    SocialView1(imageicon: "Appleicon", action: {
                        print("Apple Sign In action triggered")
                    }, buttonText: "Sign In With Apple")
                    
                    SocialView1(imageicon: "Google", action: {
                        Task {
                            do {
                                try await authService.signInWithGoogle()
                            } catch {
                                print("Google Sign-In failed: \(error.localizedDescription)")
                            }
                        }
                    }, buttonText: "Sign In With Google")
                    
                    HStack {
                        Text("Not a Member? ")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Button(action: {
                           dismiss()
                        }) {
                            Text("Create an Account")
                                .font(.system(size: 14))
                                .foregroundColor(.lightcolor)
                        }
                    }
                    .frame(maxWidth: 343, alignment: .center)
                    .padding(.top, 20)

                }
                
                // Navigation to HomeView once the user is authenticated
                NavigationLink(destination: HomeView(), isActive: $navigateToHomeView) {
                   EmptyView()  // Hidden trigger for HomeView navigation
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .onChange(of: authService.isUserAuthenticated) { isAuthenticated in
            if isAuthenticated {
                // Once the user is authenticated, navigate to HomeView
                DispatchQueue.main.async {
                    navigateToHomeView = true
                }
            }
        }
    }
}

