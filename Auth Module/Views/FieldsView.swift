//
//  FieldsView.swift
//  Auth Module
//
//  Created by apple on 26/02/2025.
//

import SwiftUI
struct FieldsView: View {
    
    @Binding var username: String
    @State var imageicon: String
    @State var Labeltxt: String
    
    
    var body: some View {
        
        
        
        VStack (alignment: .leading, spacing: 10) {
            
            Text(Labeltxt)
                .foregroundColor(.white)
            
            
            HStack {
                TextField("Enter your username", text: $username)
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
                    .frame(maxWidth: 343, maxHeight: 45)
                
            }
            
        }
        
        
        
    }
    
    
}

