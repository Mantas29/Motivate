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
}
