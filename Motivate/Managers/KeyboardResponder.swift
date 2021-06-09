//
//  KeyboardResponder.swift
//  Motivate
//
//  Created by T1001 on 2021-02-28.
//

import SwiftUI
import Combine

class KeyboardResponder: ObservableObject {
    @Published private(set) var currentHeight: CGFloat = 0
    @Published private(set) var keyboardActive = false
    
    private var keyboardOpenObserver: AnyCancellable?
    private var keyboardCloseObserver: AnyCancellable?
    
    init() {
        keyboardOpenObserver = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0 }
            .sink { [weak self] height in
                self?.currentHeight = height
                self?.keyboardActive = true
            }
        
        keyboardCloseObserver = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] _ in
                self?.currentHeight = 0
                self?.keyboardActive = false
            }
    }
}
