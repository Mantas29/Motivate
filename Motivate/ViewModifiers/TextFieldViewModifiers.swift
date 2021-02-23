//
//  TextFieldViewModifiers.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .setCaptionStyle()
            .padding(10)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.vermilion, lineWidth: 2))
    }
}
