//
//  MessageView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-24.
//

import SwiftUI



struct MessageView: View {
    
    enum MessageType {
        case success
        case failed
        
        var color: Color {
            switch self {
            case .failed:
                return .red
            case .success:
                return .green
            }
        }
    }
    
    let type: MessageType
    let message: String
    
    var body: some View {
        Text(message)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .setCaptionStyle()
            .setSmallPadding(.all)
            .frame(maxWidth: .infinity)
            .background(type.color)
            .cornerRadius(14)
            .setSmallPadding(.all)
            .align(.top)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(type: .success, message: "Success! Success! Success! Success! Success! Success! Success! Success! Success! Success! Success! Success!")
    }
}
