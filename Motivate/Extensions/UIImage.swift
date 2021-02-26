//
//  UIImage.swift
//  Motivate
//
//  Created by T1001 on 2021-02-26.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

enum FilterType : String {
    case Chrome = "CIPhotoEffectChrome"
    case Fade = "CIPhotoEffectFade"
    case Instant = "CIPhotoEffectInstant"
    case Mono = "CIPhotoEffectMono"
    case Noir = "CIPhotoEffectNoir"
    case Process = "CIPhotoEffectProcess"
    case Tonal = "CIPhotoEffectTonal"
    case Transfer =  "CIPhotoEffectTransfer"
}

extension UIImage {
    func addFilter(filter : FilterType) -> UIImage? {
        let ciContext = CIContext()
        let ciInput = CIImage(image: self)
        
        let filter = CIFilter.sepiaTone()
        filter.intensity = Float.random(in: 0.3...0.8)
        filter.setValue(ciInput, forKey: kCIInputImageKey)
        
        guard let ciOutput = filter.outputImage else { return nil }
        
        if let cgImage = ciContext.createCGImage(ciOutput, from: ciOutput.extent) {
            return UIImage(cgImage: cgImage, scale: 1, orientation: self.imageOrientation)
        }
        
        return nil
    }
}
