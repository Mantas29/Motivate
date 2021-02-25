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
    @Published var showPhotoPreview = false
    
    func processImage() {
        guard let image = originalImage else { return }
        
        let imageFilterManager = ImageFilterManager()
        let orientation = image.imageOrientation
        let ciImage = CIImage(image: image)
        
        imageFilterManager.filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        if let newImage = imageFilterManager.applyProcessing(orientation: orientation) {
            processedImage = newImage
        }
    }
    
    func setImage(uiImage: UIImage) {
        originalImage = uiImage
        processedImage = uiImage
        withAnimation(.spring()) {
            showPhotoPreview = true
        }
    }
}
