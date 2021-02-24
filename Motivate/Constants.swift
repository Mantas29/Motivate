//
//  Constants.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import Foundation
import SwiftUI

enum FontName: String {
    case regular = "JosefinSans-Regular"
    case medium = "JosefinSans-Medium"
    case bold = "JosefinSans-Bold"
}

enum Padding {
    static let extraSmall: CGFloat = 8
    static let small: CGFloat = 16
    static let regular: CGFloat = 24
    static let big: CGFloat = 32
    static let extraBig: CGFloat = 40
}

extension Color {
    static let myBlue = Color(red: 62 / 255, green: 146 / 255, blue: 204 / 255)
    static let myGreen = Color(red: 12 / 255, green: 124 / 255, blue: 89 / 255)
    static let myWhite = Color(red: 249 / 255, green: 231 / 255, blue: 231 / 255)
    static let myElectric = Color(red: 125 / 255, green: 226 / 255, blue: 209 / 255)
    static let myRed = Color(red: 214 / 255, green: 73 / 255, blue: 51 / 255)
    
    static let facebookColor = Color(red: 24 / 255, green: 119 / 255, blue: 242 / 255)
}

extension View {
    func font(_ name: FontName, size: CGFloat) -> some View {
        self.font(.custom(name.rawValue, size: size))
    }
    
    func setTitleStyle() -> some View {
        font(.bold, size: 24)
    }
    
    func setCaptionStyle() -> some View {
        font(.medium, size: 18)
    }
    
    func setRegularStyle() -> some View {
        font(.regular, size: 14)
    }
}

extension View {
    func setExtraSmallPadding(_ edges: Edge.Set) -> some View {
        padding(edges, Padding.extraSmall)
    }
    
    func setSmallPadding(_ edges: Edge.Set) -> some View {
        padding(edges, Padding.small)
    }
    
    func setRegularPadding(_ edges: Edge.Set) -> some View {
        padding(edges, Padding.regular)
    }
    
    func setBigPadding(_ edges: Edge.Set) -> some View {
        padding(edges, Padding.big)
    }
    
    func setExtraBigPadding(_ edges: Edge.Set) -> some View {
        padding(edges, Padding.extraBig)
    }
}
