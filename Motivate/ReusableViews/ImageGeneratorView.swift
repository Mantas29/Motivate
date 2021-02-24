//
//  ImageGeneratorView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import SwiftUI
import UIKit

private enum Const {
    static let cornerRadius: CGFloat = 30
}

struct ImageGeneratorView: View {
    
    let image: Image
    let closeAction: () -> Void
    
    var body: some View {
        VStack(spacing: Padding.extraSmall) {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .setRegularPadding([.top, .trailing])
                .align(.trailing)
                .onTapGesture {
                    withAnimation {
                        closeAction()
                    }
                }
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(Const.cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue, lineWidth: 2))
                .setExtraSmallPadding(.all)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(Const.cornerRadius)
        .shadow(radius: 4)
        .setSmallPadding(.all)
    }
}

struct ImageGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGeneratorView(image: Image(systemName: "house"), closeAction: {})
    }
}
