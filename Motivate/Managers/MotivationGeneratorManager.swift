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
    @Published private(set) var isLoading = false
    
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
        options.confidenceThreshold = 0.6
        
        let labeler = ImageLabeler.imageLabeler(options: options)
        
        labeler.process(image) { labels, error in
            guard error == nil, let labels = labels else { return }
            Networking.getQuoteRequest(imageLabels: labels) { [weak self] result in
                switch result {
                case .success(let quote):
                    self?.currentQuote = quote
                case .failure(let error):
                    BaseViewModel.shared.showMessage(type: .failed, message: error.localizedDescription)
                }
            }
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
