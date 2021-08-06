//
//  MainViewModel.swift
//  Motivate
//
//  Created by Mantas Skeiverys on 2021-08-07.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var presentImagePicker = false
    @Published var presentPhotoPreview = false
    
    var currentImagePickerType: UIImagePickerController.SourceType = .photoLibrary
    
    func presentImagePicker(type: UIImagePickerController.SourceType) {
        currentImagePickerType = type
        presentImagePicker = true
    }
}
