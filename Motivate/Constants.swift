//
//  Constants.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import Foundation
import SwiftUI

private enum FontName: String {
    case regular = "JosefinSans-Regular"
    case medium = "JosefinSans-Medium"
    case bold = "JosefinSans-Bold"
}

private enum Padding {
    static let extraSmall: CGFloat = 8
    static let small: CGFloat = 16
    static let regular: CGFloat = 24
    static let big: CGFloat = 32
    static let extraBig: CGFloat = 40
}

extension Text {
    private func font(_ name: FontName, size: CGFloat) -> some View {
        self.font(.custom(name.rawValue, size: size))
    }
    
    private func setBaselineOffsetForJosefinFont() -> Text {
        baselineOffset(-5)
    }
    
    func setTitleStyle() -> some View {
        setBaselineOffsetForJosefinFont()
            .font(.bold, size: 24)
    }
    
    func setCaptionStyle() -> some View {
        setBaselineOffsetForJosefinFont()
            .font(.medium, size: 18)
    }
    
    func setRegularStyle() -> some View {
        setBaselineOffsetForJosefinFont()
            .font(.regular, size: 14)
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
