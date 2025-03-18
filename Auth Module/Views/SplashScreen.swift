//
//  SplashScreen.swift
//  Auth Module
//
//  Created by apple on 25/02/2025.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        ZStack{
            BackGround()
            VStack {

                // Add an image or logo for your splash screen
                Image("logoimg")  // Replace with your own logo image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 78.25)
                    .padding()
                
                // Optionally, add a title or text
                Text("My Mufti")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
            //.background(Color.green) // You can set the background color for the splash screen
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all) // To ignore safe area insets
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

