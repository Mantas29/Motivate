//
//  SignInView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("LOGIN")
                .setTitleStyle()
            TextField("Username", text: $username)
            TextField("Password", text: $password)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .setRegularPadding(.horizontal)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
