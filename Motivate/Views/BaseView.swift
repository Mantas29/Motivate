//
//  BaseView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct BaseView: View {
    
    @ObservedObject var loginManager = UserLoginManager()
    
    var body: some View {
        if loginManager.isLoggedIn {
            HomeView(loginManager: loginManager)
        } else {
            LoginView(loginManager: loginManager)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
