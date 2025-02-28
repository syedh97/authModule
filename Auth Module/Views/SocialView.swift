//
//  SocialView.swift
//  Auth Module
//
//  Created by apple on 26/02/2025.
//

import SwiftUI

struct SocialView: View {
    
    var action: () -> Void
    var btntext: String  // Add a parameter for dynamic text
    var body: some View {
        
       
            
            VStack(spacing: 20){
                
                Button(action: {
                    // Handle Sign Up Action
                 action()
                    
                }) {
                    Text(btntext)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: 320)
                        .padding()
                        .background(.lightcolor)
                        .cornerRadius(10)
                }
                
                HStack{
                    
                    Rectangle()
                        .fill(Color.white)  // Color of the bar
                        .frame(width: 140, height: 1)  // Set height to 1 for a thin bar
                       // .padding()  // Optional: Adjust the padding around the bar
                    Text("OR")
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .fill(Color.white)  // Color of the bar
                        .frame(width: 140, height: 1)  // Set height to 1 for a thin bar
                        //.padding()
                }
                
                
            }
            
          
            
           
            
        }
        
    }


