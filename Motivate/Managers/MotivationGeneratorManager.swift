//
//  MotivationGeneratorManager.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import Foundation
import SwiftUI
import UIKit
import MLKit

class MotivationGeneratorManager: ObservableObject {
    
    static var shared = MotivationGeneratorManager()
    
    var originalImage: UIImage?
    
    @Published private(set) var processedImage: UIImage?
    @Published private(set) var currentQuote: String?
    
    @Published var showPhotoPreview = false
    
    func processImage() {
        if let image = originalImage {
            processedImage = image.addFilter(type: FilterType.randomPhotoEffect() ?? .chrome)?
                .addFilter(type: .blur(radius: 4))
            currentQuote = Quotes.randomQuoteText()
        }
    }
    
    func labelImage() {
        guard let originalImage = originalImage else {
            print("error")
            return
        }
        let image = VisionImage(image: originalImage)
        
        let options = ImageLabelerOptions()
        options.confidenceThreshold = 0.7
        
        let labeler = ImageLabeler.imageLabeler(options: options)
        
        labeler.process(image) { labels, error in
            guard error == nil, let labels = labels else { return }
            var myQuote = ""
            for label in labels {
                myQuote.append("\(label.text): \(String(format: "%.2f", label.confidence))\n")
            }
            self.currentQuote = myQuote
        }
    }
    
    func setImage(uiImage: UIImage) {
        originalImage = uiImage
        processedImage = uiImage
        currentQuote = nil
        withAnimation(.spring()) {
            showPhotoPreview = true
        }
    }
}
