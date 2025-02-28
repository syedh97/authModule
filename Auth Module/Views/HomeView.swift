import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @EnvironmentObject var authService: AuthService

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome, \(authService.signedInEmail) to the Home View!")
                    .font(.largeTitle)
                    .padding()

                Button("Log Out") {
                    // Sign out the user and set isUserAuthenticated to false
                    try? Auth.auth().signOut()
                    authService.isUserAuthenticated = false
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                // Navigation Link to go back to the Sign-In screen when the user is not authenticated
                NavigationLink(
                    destination: LoginView(), // Your sign-in view
                    isActive: .constant(!authService.isUserAuthenticated) // If not authenticated, show sign-in
                ) {
                    EmptyView() // The link is invisible
                }
            }
            .navigationBarBackButtonHidden(true)  // Hide the back button
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthService())  // Provide the AuthService in the preview
    }
}

