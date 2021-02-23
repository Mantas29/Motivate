//
//  MainButton.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .setCaptionStyle()
                .setSmallPadding(.vertical)
                .setBigPadding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.budGreen))
                .scaleEffect(configuration.isPressed ? 0.95: 1)
                .animation(.spring())
        }
}
