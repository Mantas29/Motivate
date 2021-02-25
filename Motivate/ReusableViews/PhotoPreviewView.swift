//
//  ImageGeneratorView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import SwiftUI

private enum Const {
    static let cornerRadius: CGFloat = 30
    static let dragThreshold: CGFloat = 130
}

struct PhotoPreviewView: View {
    
    @ObservedObject var generator = MotivationGeneratorManager.shared
    
    @State private var yOffset = CGFloat.zero
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
            
            if let uiImage = generator.processedImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Const.cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.blue, lineWidth: 2))
                    .setExtraSmallPadding(.all)
            }
            
            Button(action: {
                generator.processImage()
            }, label: {
                Text("Beautify!")
            }).buttonStyle(MainButtonStyle(color: .myBlue))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(Const.cornerRadius)
        .shadow(radius: 4)
        .setSmallPadding(.all)
        .offset(y: yOffset)
        .opacity(Double(1 - (yOffset - Const.dragThreshold) / 300))
        .gesture(
            DragGesture()
                .onChanged { gesture  in
                    if gesture.translation.height > 0 {
                        yOffset = gesture.translation.height / 1.3
                    }
                }
                .onEnded({ _ in
                    withAnimation(.spring()) {
                        if yOffset > Const.dragThreshold {
                            closeAction()
                        } else {
                            yOffset = .zero
                        }
                    }
                }))
    }
}

//struct ImageGeneratorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageGeneratorView(image: UIImage(), closeAction: {})
//    }
//}
