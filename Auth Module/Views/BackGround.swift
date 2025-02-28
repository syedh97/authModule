//
//  BackGround.swift
//  Auth Module
//
//  Created by apple on 25/02/2025.
//

import Foundation


import SwiftUI

extension Color {
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        var int = UInt64(0)
        Scanner(string: hexSanitized).scanHexInt64(&int)
        
        let red = Double((int >> 16) & 0xFF) / 255.0
        let green = Double((int >> 8) & 0xFF) / 255.0
        let blue = Double(int & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct BackGround: View {
    var body: some View {
        HStack {
            // LinearGradient background that covers the entire screen
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#13473E"), Color(hex: "#031313")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all) // Ensures the gradient covers the entire screen
            
            // Your other content can go here. For example:
            
        }
    }
}

#Preview {
    BackGround()
}


