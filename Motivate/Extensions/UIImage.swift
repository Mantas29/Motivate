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

enum FilterType {
    case blur(radius: NSNumber)
    case chrome
    case median
    
    var name: String {
        switch self {
        case .blur:
            return "CIGaussianBlur"
        case .chrome:
            return "CIPhotoEffectChrome"
        case .median:
            return "CIMedianFilter"
        }
    }
    
    var parameters: [String : NSNumber]? {
        switch self {
        case .blur(let radius):
            return [kCIInputRadiusKey : radius]
        case .chrome:
            return nil
        case .median:
            return nil
        }
    }
}

extension UIImage {
    func addFilter(type: FilterType) -> UIImage? {
        let ciContext = CIContext()
        let ciInput = CIImage(image: self)
        
        guard let filter = CIFilter(name: type.name) else { return nil }
        
        if let parameters = type.parameters {
            for parameter in parameters {
                filter.setValue(parameter.value, forKey: parameter.key)
            }
        }
        
        filter.setValue(ciInput, forKey: kCIInputImageKey)
        
        guard let ciOutput = filter.outputImage else { return nil }
        
        if let cgImage = ciContext.createCGImage(ciOutput, from: ciOutput.extent) {
            return UIImage(cgImage: cgImage, scale: 1, orientation: self.imageOrientation)
        }
        
        return nil
    }
}
