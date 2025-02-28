//
//  PasswordField.swift
//  Auth Module
//
//  Created by apple on 26/02/2025.
//

import SwiftUI
struct PasswordField: View {
    
    @Binding var password: String
    @State  var placeholder: String
    @State var imageicon: String

    
    var body: some View {
        
        
            //BackGround()
            
            VStack(alignment: .leading, spacing:10){
                Text("Password: ")
                    .foregroundColor(.white)
                
                HStack{
                    
                    
                    
                    
                    SecureField(placeholder, text: $password)
                    
                        .padding(10)
                    // Adds padding inside the text field
                        .foregroundColor(.white)
                        .background(Color.gray.opacity(0.65)) // Gray background color
                        .cornerRadius(10) // Rounds the corners of the TextField with 10-point radius
                        .overlay(
                            HStack {
                                Spacer() // This makes sure the image is on the trailing side
                                Image(imageicon)
                                
                                    .resizable() // Makes the image resizable
                                    .scaledToFit() // Ensures the image fits inside its container
                                    .frame(width: 30, height: 30) // Sets the image size
                                
                                    .padding(.trailing, 10) // Adds padding to the right of the image
                            }
                        )
                }
                .frame(maxWidth: 343, maxHeight: 45)
                
            }
        }
        
}

//#Preview {
    
  //  PasswordField(password: "1234", placeholder: "Enter password", imageicon: "Eye")
   
//}
