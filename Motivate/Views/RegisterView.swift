//
//  RegisterView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var loginManager: UserLoginManager
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            MainBackground()
            VStack(spacing: Padding.small) {
                Text("Register")
                    .setTitleStyle()
                Spacer()
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.newPassword)
                SecureField("Confirm Password", text: $confirmPassword)
                    .textContentType(.newPassword)
                Button(action: {
                    if credentialsAccepted {
                        loginManager.register(email: email, password: password)
                    }
                }, label: {
                    Text("Confirm")
                }).buttonStyle(MainButtonStyle(color: .budGreen))
                Spacer()
            }
            .setRegularPadding(.all)
            .textFieldStyle(MainTextFieldStyle())
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
    private var credentialsAccepted: Bool {
        return email.isEmail && password == confirmPassword && password.isStrongPassword
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(loginManager: UserLoginManager())
    }
}
