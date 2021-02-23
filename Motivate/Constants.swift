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
    static let budGreen = Color(red: 127 / 255, green: 176 / 255, blue: 105 / 255)
    static let cream = Color(red: 255 / 255, green: 251 / 255, blue: 189 / 255)
    static let fawn = Color(red: 230 / 255, green: 170 / 255, blue: 104 / 255)
    static let vermilion = Color(red: 202 / 255, green: 60 / 255, blue: 37 / 255)
    static let blackChocolate = Color(red: 29 / 255, green: 26 / 255, blue: 5 / 255)
}

extension View {
    func font(_ name: FontName, size: CGFloat) -> some View {
        self.font(.custom(name.rawValue, size: size))
    }
    
    func setTitleStyle() -> some View {
        font(.bold, size: 24)
            .foregroundColor(.blackChocolate)
    }
    
    func setCaptionStyle() -> some View {
        font(.medium, size: 18)
            .foregroundColor(.blackChocolate)
    }
    
    func setRegularStyle() -> some View {
        font(.regular, size: 14)
            .foregroundColor(.blackChocolate)
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
