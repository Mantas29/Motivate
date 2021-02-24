//
//  SignInView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import SwiftUI

struct LoginView: View {
    
    var loginManager: UserLoginManager
    @State private var email = ""
    @State private var password = ""
    
    @State private var showRegisterSheet = false
    
    var body: some View {
        ZStack {
            MainBackground()
            
            VStack(spacing: Padding.small) {
                Text("Welcome to Meditate")
                    .foregroundColor(.vermilion)
                    .font(.bold, size: 30)
                Spacer()
                Text("LOGIN")
                    .setTitleStyle()
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    
                HStack {
                    Button(action: {
                        loginManager.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign in")
                    }).buttonStyle(MainButtonStyle(color: .budGreen))
                    
                    Button(action: {
                        showRegisterSheet = true
                    }, label: {
                        Text("Register")
                    }).buttonStyle(MainButtonStyle(color: .vermilion))
                }
                
                Button(action: {
                    loginManager.resetPassword(email: email)
                }, label: {
                    Text("Forgot your password?")
                        .foregroundColor(.blue)
                        .setCaptionStyle()
                })
                
                Button(action: {
                    loginManager.facebookLogin()
                }, label: {
                    Text("Login with Facebook")
                }).buttonStyle(FacebookButtonStyle())
                
                Spacer()
            }
            .textFieldStyle(MainTextFieldStyle())
            .setRegularPadding(.all)
            .ignoresSafeArea(.keyboard)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .sheet(isPresented: $showRegisterSheet, content: {
            RegisterView(loginManager: loginManager)
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginManager: UserLoginManager())
    }
}
