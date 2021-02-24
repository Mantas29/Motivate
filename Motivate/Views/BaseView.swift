//
//  BaseView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct BaseView: View {
    
    @ObservedObject var loginManager = UserLoginManager()
    @ObservedObject var baseViewModel = BaseViewModel.shared
    
    var body: some View {
        ZStack {
            if loginManager.isLoggedIn {
                MainView()
            } else {
                LoginView(loginManager: loginManager)
            }
            
            if baseViewModel.shouldShowMessage {
                baseViewModel.messageView
                    .zIndex(1)
                    .transition(.move(edge: .top))
            }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
