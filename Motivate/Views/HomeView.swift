//
//  HomeView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var loginManager: UserLoginManager
    
    var body: some View {
        VStack {
            Text("THIS IS A HOME VIEW")
            Button(action: {
                loginManager.signOut()
            }, label: {
                Text("Sign out")
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(loginManager: UserLoginManager())
    }
}
