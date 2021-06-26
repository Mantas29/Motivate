//
//  ImageGeneratorView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import SwiftUI

private enum Const {
    static let cornerRadius: CGFloat = 20
    static let fontSize: CGFloat = 34
}

struct PhotoPreviewView: View {
    
    @ObservedObject private var generator = MotivationGeneratorManager.shared
    
    @State private var yOffset = CGFloat.zero
    let closeAction: () -> Void
    
    var body: some View {
        VStack(spacing: Padding.extraSmall) {
            
            CloseButton(tapAction: closeAction)
            
            ZStack {
                if let uiImage = generator.processedImage {
                    ImageWithQuoteView(uiImage: uiImage,
                                       quote: generator.currentQuote)
                }
                else if let uiImage = generator.originalImage {
                    ImageWithQuoteView(uiImage: uiImage)
                }
                if generator.isLoading {
                    ProgressView()
                }
            }
            
            InspireMeButton()
            
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
                    .font(Quotes.randomFont(), size: Const.fontSize)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .setSmallPadding(.all)
                    .cornerRadius(6)
                    .background(Color.black.opacity(0.3).blur(radius: 10))
            }
        }
        .setExtraSmallPadding(.all)
    }
}

private struct InspireMeButton: View {
    
    let generator = MotivationGeneratorManager.shared
    
    var body: some View {
        Button(action: {
            generator.generateQuote()
        }, label: {
            Text("Inspire me!")
        }).buttonStyle(MainButtonStyle(color: .myGreen))
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

struct PhotoPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPreviewView(closeAction: {})
    }
}
