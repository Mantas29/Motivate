//
//  ImageGeneratorView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import SwiftUI

private enum Const {
    static let cornerRadius: CGFloat = 20
    static let dragThreshold: CGFloat = 130
}

struct PhotoPreviewView: View {
    
    @ObservedObject private var generator = MotivationGeneratorManager.shared
    
    @State private var yOffset = CGFloat.zero
    let closeAction: () -> Void
    
    var body: some View {
        VStack(spacing: Padding.extraSmall) {
            
            CloseButton(tapAction: closeAction)
            
            if let uiImage = generator.processedImage {
                ImageWithQuoteView(uiImage: uiImage,
                                   quote: generator.currentQuote)
            }
            else if let uiImage = generator.originalImage {
                ImageWithQuoteView(uiImage: uiImage)
            } else {
                ProgressView()
            }
            
            InspireButton()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(Const.cornerRadius)
        .shadow(radius: 4)
        .setSmallPadding(.horizontal)
        .setRegularPadding(.vertical)
        .addDragToCloseGesture(yOffset: $yOffset,
                               closeAction: closeAction)
    }
}

private struct ImageWithQuoteView: View {
    
    let uiImage: UIImage
    var quote: String?
    
    var body: some View {
        ZStack {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(Const.cornerRadius)
            
            if let quote = quote {
                Text(quote)
                    .font(Quotes.randomFont(), size: 26)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .setSmallPadding(.all)
            }
        }
        .setExtraSmallPadding(.all)
    }
}

private struct InspireButton: View {
    
    let generator = MotivationGeneratorManager.shared
    
    var body: some View {
        Button(action: {
            generator.processImage()
        }, label: {
            Text("Inspire Me!")
        }).buttonStyle(MainButtonStyle(color: .myRed))
    }
}

private struct CloseButton: View {
    
    let tapAction: () -> Void
    
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .setRegularPadding([.top, .trailing])
            .align(.trailing)
            .onTapGesture {
                withAnimation {
                    tapAction()
                }
            }
    }
}

extension View {
    func addDragToCloseGesture(yOffset: Binding<CGFloat>, closeAction: @escaping () -> Void) -> some View {
        opacity(Double(1 - (yOffset.wrappedValue - Const.dragThreshold) / 300))
        .offset(y: yOffset.wrappedValue)
        .gesture(
            DragGesture()
                .onChanged { gesture  in
                    if gesture.translation.height > 0 {
                        yOffset.wrappedValue = gesture.translation.height / 1.3
                    }
                }
                .onEnded({ _ in
                    withAnimation(.spring()) {
                        if yOffset.wrappedValue > Const.dragThreshold {
                            closeAction()
                        } else {
                            yOffset.wrappedValue = .zero
                        }
                    }
                }))
    }
}

struct PhotoPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPreviewView(closeAction: {})
    }
}
