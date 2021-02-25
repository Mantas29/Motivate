//
//  MainButton.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    let color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(foregroundColor)
                .setCaptionStyle()
                .setSmallPadding(.vertical)
                .setBigPadding(.horizontal)
                .frame(minWidth: 180)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(color))
                .scaleEffect(configuration.isPressed ? 0.95: 1)
        }
    
    var foregroundColor: Color {
        switch color {
        case .myRed, .myBlue, .myGreen:
            return .white
        default:
            return .black
        }
    }
}

struct FacebookButtonStyle: ButtonStyle {
        
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(.white)
                .font(.bold, size: 18)
                .setSmallPadding(.vertical)
                .setBigPadding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.facebookColor))
                .scaleEffect(configuration.isPressed ? 0.95: 1)
        }
}
