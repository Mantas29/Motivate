//
//  SignInView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        ZStack {
            MainBackground()
            
            VStack{
                if !keyboardResponder.keyboardActive {
                    Title()
                }
                Spacer()
                Content()
                Spacer()
            }
            .setRegularPadding(.all)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

private struct Title: View {
    var body: some View {
        Text("Welcome to Meditate")
            .foregroundColor(.myRed)
            .font(.bold, size: 30)
    }
}

private struct Content: View {
    
    @EnvironmentObject var loginManager: UserLoginManager
    @State private var email = ""
    @State private var password = ""
    @State private var showRegisterSheet = false
    
    var body: some View {
        VStack(spacing: Padding.small) {
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
                }).buttonStyle(MainButtonStyle(color: .myGreen))
                
                Button(action: {
                    showRegisterSheet = true
                }, label: {
                    Text("Register")
                }).buttonStyle(MainButtonStyle(color: .myRed))
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
        }
        .textFieldStyle(MainTextFieldStyle())
        .sheet(isPresented: $showRegisterSheet, content: {
            RegisterView()
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
