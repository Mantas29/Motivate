//
//  MotivationGeneratorManager.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import Foundation
import SwiftUI
import UIKit

class MotivationGeneratorManager: ObservableObject {
    
    static var shared = MotivationGeneratorManager()
    
    var originalImage: UIImage?
    
    @Published private(set) var processedImage: UIImage?
    @Published private(set) var currentQuote: String?
    
    @Published var showPhotoPreview = false
    
    func processImage() {
        if let image = originalImage {
            processedImage = image.addFilter(filter: .Mono)
            currentQuote = Quotes.randomQuoteText()
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
