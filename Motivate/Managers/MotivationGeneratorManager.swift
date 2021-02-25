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
    
    @Published var uiImage: UIImage?
    @Published var showPhotoPreview = false
    
    let imageFilterManager = ImageFilterManager()
    
    func processImage() {
        guard let image = uiImage else { return }
        
        let beginImage = CIImage(image: image)
        imageFilterManager.filter.setValue(beginImage, forKey: kCIInputImageKey)
        if let processedImage = imageFilterManager.applyProcessing() {
            uiImage = processedImage
        }
    }
}
