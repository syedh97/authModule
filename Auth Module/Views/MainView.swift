import Foundation
import SwiftUI
import FirebaseAuth

struct MainView: View {
    var body: some View {
        @EnvironmentObject var authService: AuthService

        
        NavigationStack {
            ZStack {
                
                BackGround()  // Ensure this is the full-screen background
                
                
                Image("iPhone14img")
                
                LinearGradient(gradient: Gradient(colors: [.newbg.opacity(0), .black]),
                               startPoint: .top,
                               endPoint: .bottom)
                
                VStack(spacing: 30){
                    Spacer()
                    
                    VStack {
                        // "Solution of All Islamic" text
                        Text("Solution of All Islamic")
                            .font(.system(size: 32))  // Increase font size
                            .fontWeight(.bold)
                            .foregroundColor(.white)  // White color for "Solution of All"
                        
                        // "Queries" text
                        Text("Queries")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.lightcolor) // Red color for "Queries"
                            .frame(maxWidth: .infinity)
                        
                        // Description text
                        Text("Explore and ask questions and connect with")
                            .foregroundColor(.gray)
                        
                        Text("scholars your journey of learning")
                            .foregroundColor(.gray)
                        
                    }
                    
                    VStack{
                        // "JOIN NOW" button
                        NavigationLink(destination: SignUpView()) {
                            Text("JOIN NOW")
                                .font(.system(size: 20))
                                .frame(maxWidth: 320)
                                .fontWeight(.bold)
                                .padding()
                                .background(.lightcolor)  // Button background color
                                .foregroundColor(.black) // Button text color
                                .cornerRadius(16)  // Rounded corners for the button
                        }
                        
                    }
                    .padding(.top, 40)
                }
                
            }
        }
    }
}
#Preview {
    MainView()
        .environmentObject(AuthService())
}

