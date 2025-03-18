import SwiftUI

struct Cards: View {
    @State private var showGreeting = true
    @State private var selectedImage: UIImage? = nil  // State for selected image
    @State private var isImagePickerPresented: Bool = false  // To present the image picker
    @State private var hasTitle = true
    @EnvironmentObject var authService: AuthService
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        
            ZStack {
                BackGround()  // Ensure you have a custom background view here
                VStack {
                    VStack {
                        // Profile image with gesture to pick a new image
                        Image(uiImage: selectedImage ?? UIImage(named: "Manimage")!)  // Use the selected image or default to "manicon"
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                            .overlay {
                                Image("pix")
                                .offset(y: 45)
                            }
                            .onTapGesture {
                                isImagePickerPresented.toggle()  // Toggle image picker when tapped
                            }
                        
                        // Display the username and email
                        Text( "Usman Ali")  // Use the username from authService or default to "Usman Ali"
                            .foregroundColor(.white)
                        
                        Text(authService.signedInEmail)
                            .foregroundColor(.white)
                    }
                    
                    ScrollView {
                        VStack(spacing: 9) {
                            // Reusing IconTextView with different data
                            IconTextView(imageName: "UserRounded", labelText: "Change Username")
                            IconTextView(imageName: "Lock", labelText: "Change password")
                            IconTextView(imageName: "Global", labelText: "Language")
                            
                            HStack {
                                Image("Bell")
                                Toggle("Notifications", isOn: $showGreeting)
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.9))
                        
                        VStack(spacing: 9) {
                            NavigationLink(destination: QuestionsView()) {
                                IconTextView(imageName: "Question Circle", labelText: "My Asked Questions")
                                
                            }
                            
                            NavigationLink(destination: AppointmentsView()) {
                                IconTextView(imageName: "Calendar", labelText: "My Appointments")
                            }
                            
                            IconTextView(imageName: "Calendar Add", labelText: "Favorite Events")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.9))
                        
                        VStack(spacing: 9) {
                            IconTextView(imageName: "Siren Rounded", labelText: "Help and Feedback ")
                            IconTextView(imageName: "Shield Check", labelText: "Privacy Policy ")
                            IconTextView(imageName: "Clipboard", labelText: "Terms and conditions")
                            IconTextView(imageName: "Share", labelText: "Share/Invite")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.9))
                        
                        IconTextView(imageName: "Trash", labelText: "Delete Account: ", foregroundColor: .red)
                            .padding()
                            .background(Color.gray.opacity(0.9))
                        
                        Button {
                            // Handle logout logic and dismiss view
                            authService.isUserAuthenticated = false
                            dismiss()
                        } label: {
                            Text("Logout")
                                .frame(maxWidth: 343)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color(.btng))
                        .cornerRadius(16)
                        .padding(.top, 30)
                    }
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage, onDismiss: {
                    isImagePickerPresented = false  // Dismiss image picker when done
                })
            }
        
    }
}

