//
//  BaseViewModel.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import Foundation
import SwiftUI

class BaseViewModel: ObservableObject {
    
    private var timer: Timer?
    
    static var shared = BaseViewModel()
    
    @Published private(set) var shouldShowMessage = false
    private(set) var messageView: MessageView?
    
    func showMessage(type: MessageView.MessageType, message: String) {
        
        let messageIsAlreadyPresented = shouldShowMessage
        
        if messageIsAlreadyPresented {
            timer?.invalidate()
            self.shouldShowMessage = false
        }
        
        messageView = MessageView(type: type, message: message)
        
        Timer.scheduledTimer(withTimeInterval: messageIsAlreadyPresented ? 1.5 : 0.3, repeats: false) { _ in
            withAnimation(Animation.spring()) {
                self.shouldShowMessage = true
            }
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            withAnimation(Animation.spring()) {
                self.shouldShowMessage = false
            }
        }
    }
}
