

import SwiftUI

// Reusable IconTextView component
struct IconTextView: View {
    var imageName: String  // Image name
    var labelText: String
    var foregroundColor: Color = .white  // Default color is white, but can be customized
// Text label

    var body: some View {
        
            HStack {
                Image(imageName) // Displaying the system icon
                .foregroundColor(foregroundColor)  // You can change the color
                Text(labelText)
//                .font(.customFont(.regular, 14))
                .font(Font.poppinRegular(size: 16))
                
                .foregroundColor(foregroundColor)
                
                Spacer()
                 Image("AltArrow")
            }
            .frame(maxWidth: .infinity, alignment: .leading )

    }
}

