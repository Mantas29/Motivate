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
//
//class ImageFilterManager {
//
//    static func setSepiaToneFilter(uiImage: UIImage) -> UIImage? {
//
//        let context = CIContext()
//        let filter = CIFilter.sepiaTone()
//        let ciImage = CIImage(image: uiImage)
//
//        filter.setValue(ciImage, forKey: kCIInputImageKey)
//        filter.intensity = Float.random(in: 0.3...0.8)
//
//        guard let outputImage = filter.outputImage else { return nil }
//
//        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
//            return UIImage(cgImage: cgImage, scale: 1, orientation: uiImage.imageOrientation)
//        }
//
//        return nil
//    }
//}
