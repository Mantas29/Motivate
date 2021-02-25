//
//  ImageFilterManager.swift
//  Motivate
//
//  Created by T1001 on 2021-02-25.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

class ImageFilterManager {
    
    var filter = CIFilter.sepiaTone()
    let context = CIContext()
    
    func applyProcessing() -> UIImage? {
        
        filter.intensity = Float.random(in: 0...1)
        guard let outputImage = filter.outputImage else { return nil }
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
        
        return nil
    }
}
