//
//  SocialView1.swift
//  Auth Module
//
//  Created by apple on 26/02/2025.
//

import SwiftUI

struct SocialView1: View {
    
    @State var imageicon: String
    var action: () -> Void
    
    var buttonText: String  // Add a parameter for dynamic text
    
    var body: some View {
        
        VStack (spacing: 20){
            
            Button(action: action) {
                HStack(spacing: 1) {
                    // Image on the leading side
                    Image(imageicon) // Use system image or your custom image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 38, height: 21) // Set the image size
                        .padding(.leading, 60) // Adds padding to the left of the image
                    
                    Text(buttonText)
                        .fontWeight(.bold)
                        .foregroundColor(.black) // Color for the text
                        .padding(.trailing, 50) // Add some padding for the text
                    
                }
                
                .frame(maxWidth: 343, maxHeight: 45)
                
                .background(Color.white) // Background color for the button
                .cornerRadius(16) // Corner radius for rounded corners
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1) // Border around the button
                )
                
            }
            
        }
    }
}



