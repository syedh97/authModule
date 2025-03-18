import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        
            TabView {
                // First Tab: Home View
                ZStack {
                    BackGround()
                    VStack {
                        Text("Welcome, \(authService.signedInEmail) to the Home View!")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                        
                        // Additional content can go here
                    }
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
                // Second Tab: Profile View
                Cards() // Make sure Cards() is inside the TabView
                    .tabItem {
                        Label("Profiles", systemImage: "person.crop.circle.fill")
                    }
            }

        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    // Initialize AuthService and SignUpViewModel
    let authService = AuthService()
    authService.isUserAuthenticated = true  // Simulating an authenticated user
    authService.signedInEmail = "example@gmail.com"  // Simulated email
    
    return HomeView()
        .environmentObject(authService)
}
