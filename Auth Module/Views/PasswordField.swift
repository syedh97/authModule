import SwiftUI

struct PasswordField: View {
    
    @Binding var password: String // Binding to the view model's password
    @State var placeholder: String
    @State var imageicon: String
    @State var showPassword: Bool = false  // This state controls password visibility
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Password: ")
                .foregroundColor(.white)
            
            HStack {
                // Toggle between SecureField and TextField based on showPassword
                if showPassword {
                    TextField(placeholder, text: $password) // Show password as plain text
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.65))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: {
                                    showPassword.toggle()  // Toggle visibility
                                    imageicon = showPassword ? "Eye" : "Eye"  // Toggle icon
                                }) {
                                    Image(imageicon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.trailing, 10)
                                }
                            }
                        )
                } else {
                    SecureField(placeholder, text: $password) // Show password as hidden text
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.65))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: {
                                    showPassword.toggle()  // Toggle visibility
                                    imageicon = showPassword ? "Eye" : "Eye"  // Toggle icon
                                }) {
                                    Image(imageicon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.trailing, 10)
                                }
                            }
                        )
                }
            }
            .frame(maxWidth: 343, maxHeight: 45)
        }
    }
}

