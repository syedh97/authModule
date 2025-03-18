//
//  FontFamily.swift
//  AppointmentsModule
//
//  Created by apple on 11/03/2025.
//

import Foundation
import SwiftUI

extension Font
{
    static func poppinBold(size: CGFloat) -> Font
    {
        return .custom("Poppins-Bold", size: size)
    }
    static func poppinSemiBold(size: CGFloat) -> Font
    {
        return .custom("Poppins-SemiBold", size: size)
    }
    static func poppinRegular(size: CGFloat) -> Font
    {
        return .custom("Poppins-Regular", size: size)
    }
    static func poppinMedium(size: CGFloat) -> Font
    {
        return .custom("Poppins-Medium", size: size)
    }
    static func poppinLight(size: CGFloat) -> Font
    {
        return .custom("Poppins-Light", size: size)
    }
    static func poppinBlack(size: CGFloat) -> Font
    {
        return .custom("Poppins-Blackcolor", size: size)
    }
}

/*
 enum FontWeight {
 static let light = Font.custom("Poppins-Light", size: 14)
 static let regular = Font.custom("Poppins-Light", size: 14)
 static let medium = Font.custom("Poppins-Light", size: 14)
 static let semibold = Font.custom("Poppins-Light", size: 14)
 static let bold = Font.custom("Poppins-Light", size: 14)
 static let black = Font.custom("Poppins-Light", size: 14)
 }
 //
 //extension Font {
 //    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
 //        switch fontType {
 //        case .light:
 //            Font.custom("Poppins-Light", size: size)
 //        case .regular:
 //            Font.custom("Poppins-Regular", size: size)
 //        case .medium:
 //            Font.custom("Poppins-Medium", size: size)
 //        case .semibold:
 //            Font.custom("Poppins-SemiBold", size: size)
 //        case .bold:
 //            Font.custom("Poppins-Bold", size: size)
 //        case .black:
 //            Font.custom("Poppins-Black", size: size)
 //        }
 //    }
 //}
 //
 //extension Text {
 //    func customFont(_ fontWeight: FontWeight? = .regular, _ size: CGFloat? = nil) -> Text {
 //        return self.font(.customFont(fontWeight ?? .regular, size ?? 16))
 //    }
 //}
 
 */
