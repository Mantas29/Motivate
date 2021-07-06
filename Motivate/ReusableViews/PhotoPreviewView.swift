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
    
    @State private var isLoading = false
    
    @State private var yOffset = CGFloat.zero
    let closeAction: () -> Void
    
    var body: some View {
        VStack(spacing: Padding.extraSmall) {
            
            CloseButton(tapAction: closeAction)
            
            ZStack {
                MotivationView()
                
                if isLoading {
                    LoadingIndicator()
                }
            }
            
            InspireMeButton()
            ShareButton()
            
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
        .onReceive(MotivationGeneratorManager.shared.$isLoading) { isLoading in
            self.isLoading = isLoading
        }
    }
}

private struct MotivationView: View {
    
    @ObservedObject private var generator = MotivationGeneratorManager.shared
    
    var body: some View {
        if let uiImage = generator.processedImage {
            ImageWithQuoteView(uiImage: uiImage,
                               fontName: generator.fontName,
                               quote: generator.currentQuote)
        }
        else if let uiImage = generator.originalImage {
            ImageWithQuoteView(uiImage: uiImage)
        }
    }
}

private struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .scaleEffect(3, anchor: .center)
            .setBigPadding(.all)
            .background(Color.white.opacity(0.4))
            .cornerRadius(Const.cornerRadius)
            .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
    }
}

private struct ImageWithQuoteView: View {
    
    let uiImage: UIImage
    var fontName: FontName?
    var quote: String?
    
    var body: some View {
        ZStack {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(Const.cornerRadius)
            
            if let quote = quote {
                Text(quote)
                    .font(fontName ?? Quotes.randomFont(), size: Const.fontSize)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.4)
                    .setSmallPadding(.all)
                    .cornerRadius(6)
                    .background(Color.black.opacity(0.3).blur(radius: 10))
            }
        }
        .setExtraSmallPadding(.all)
    }
}

private struct InspireMeButton: View {
        
    var body: some View {
        Button(action: {
            MotivationGeneratorManager.shared.generateQuote()
        }, label: {
            Text("Inspire me!")
        }).buttonStyle(MainButtonStyle(color: .myGreen))
    }
}

private struct ShareButton: View {
    
    let generator = MotivationGeneratorManager.shared
    
    var body: some View {
        Button(action: {
            showShareSheet()
        }, label: {
            Text("Share")
        })
        .buttonStyle(MainButtonStyle(color: .myCyan))
    }
    
    func showShareSheet() {
        let activityVC = UIActivityViewController(activityItems: [MotivationView().snapshot()], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
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
