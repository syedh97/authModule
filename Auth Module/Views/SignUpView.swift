
import Foundation
import SwiftUI
import Firebase


struct SignUpView: View {
    
    @EnvironmentObject var authService: AuthService
    @StateObject private var viewModel = SignUpViewModel() // Initialize the ViewModel
    
    
    var body: some View {
        
        ZStack {
            BackGround()
            
            VStack {
                Image("logoimg2")
                
                VStack {
                    Text("Create Account")
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    
                    Text("Join our community and start exploring")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                .frame(maxWidth: 276, maxHeight: 53)
                
                VStack(alignment: .leading, spacing: 12) {
                    FieldsView(username: $viewModel.userName, imageicon: "User Rounded", Labeltxt: "Username:")
                    
                    FieldsView(username: $viewModel.email, imageicon: "Letter", Labeltxt: "Email:")
                    
                    PasswordField(password: $viewModel.password, placeholder: "Enter password", imageicon: "Eye")
                    
                    Text("By Signing up, you're agreed to our ")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    + Text("Terms & Conditions")
                        .font(.system(size: 12))
                        .foregroundColor(.lightcolor)
                    + Text(" and ")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    + Text("Privacy Policy")
                        .font(.system(size: 12))
                        .foregroundColor(.lightcolor)
                    
                    SocialView(action: {
                        authService.regularCreateAccount(email: viewModel.email, password: viewModel.password)
                    }, btntext: "Sign Up")
                    
                    
                    SocialView1(imageicon: "Appleicon", action: {
                        // Your code here to handle Apple Sign In
                        print("Apple Sign In action triggered")
                    }, buttonText: "Sign Up With Apple")
                    
                    
                    SocialView1(imageicon: "Google", action: {
                        
                    }, buttonText: "Sign Up With Google")
                    
                    HStack {
                        Text("Already a Member? ")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .font(.system(size: 14))
                                .foregroundColor(.lightcolor)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 15)
                }
                .frame(maxWidth: 343, maxHeight: 602)
                
                .background(
                    NavigationLink(destination: LoginView(), isActive: $authService.isUserCreated) {
                        EmptyView() // This is the hidden trigger for navigation
                    }
                        .hidden() // Hides the NavigationLink itself from the UI
                )
            }
        }
    }
    
    struct SecondView_Previews: PreviewProvider {
        static var previews: some View {
            // Initialize AuthService and SignUpViewModel with mock data for preview
            let authService = AuthService()
            authService.isUserAuthenticated = false  // Mock authentication status for preview
            
            return SignUpView()
                .environmentObject(authService)
        }
    }
}
