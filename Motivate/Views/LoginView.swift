//
//  SignInView.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import SwiftUI

struct LoginView: View {
    
    var loginManager: UserLoginManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.cream
                    .edgesIgnoringSafeArea(.all)
                BackgroundShape()
                    .fill(Color.fawn)
                    .frame(height: geometry.size.height * 0.8)
                    .align(.bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: Padding.small) {
                    Text("Welcome to Meditate")
                        .foregroundColor(.vermilion)
                        .font(.bold, size: 30)
                        .setSmallPadding(.top)
                    Spacer()
                    Text("LOGIN")
                        .setTitleStyle()
                    TextField("Username", text: $username)
                    TextField("Password", text: $password)
                    Button(action: {
                        loginManager.facebookLogin()
                    }, label: {
                        Text("Sign in with Facebook")
                    }).buttonStyle(MainButtonStyle())
                    Button(action: {
                        print("\(loginManager.isLoggedIn)")
                    }, label: {
                        Text("Button")
                    })
                    Spacer()
                }
                .textFieldStyle(MainTextFieldStyle())
                .setRegularPadding(.horizontal)
            }
        }
    }
}

private struct BackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.maxX, y: -rect.maxY * 0.05),
                      control1: CGPoint(x: rect.width * 0.4, y: rect.height * 0.1),
                      control2: CGPoint(x: rect.width * 0.6, y: rect.height * 0.1))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginManager: UserLoginManager())
    }
}
