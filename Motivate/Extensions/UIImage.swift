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
    case fade
    case instant
    case mono
    case noir
    case process
    case tonal
    case transfer
    
    var name: String {
        switch self {
        case .blur:
            return "CIGaussianBlur"
        case .chrome:
            return "CIPhotoEffectChrome"
        case .fade:
            return "CIPhotoEffectFade"
        case .instant:
            return "CIPhotoEffectInstant"
        case .mono:
            return "CIPhotoEffectMono"
        case .noir:
            return "CIPhotoEffectNoir"
        case .process:
            return "CIPhotoEffectProcess"
        case .tonal:
            return "CIPhotoEffectTonal"
        case .transfer:
            return "CIPhotoEffectTransfer"
        }
    }
    
    var parameters: [String : NSNumber]? {
        switch self {
        case .blur(let radius):
            return [kCIInputRadiusKey : radius]
        default:
            return nil
        }
    }
    
    static func randomPhotoEffect() -> FilterType? {
        let photoEffects: [FilterType] = [.chrome, .fade, .instant, .mono, .noir, .process, .tonal, .transfer]
        return photoEffects.randomElement()
    }
}

extension UIImage {
    func addFilter(type: FilterType, addBlur: Bool = false) -> UIImage? {
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
