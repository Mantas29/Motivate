//
//  LoginManager.swift
//  Motivate
//
//  Created by T1001 on 2021-02-23.
//

import Foundation
import FBSDKLoginKit
import Firebase

class UserLoginManager: ObservableObject {
    let loginManager = LoginManager()
    
    @Published var isLoggedIn = Auth.auth().currentUser != nil
    @Published var isLoading = false
    
    func facebookLogin() {
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
            switch loginResult {
            case .failed(let error):
                BaseViewModel.shared.showMessage(type: .failed, message: error.localizedDescription)
            case .cancelled:
                break
            case .success( _, _, let accessToken):
                guard let token = accessToken?.tokenString else { return }
                let credential = FacebookAuthProvider.credential(withAccessToken: token)
                self.signIn(with: credential)
            }
        }
    }
    
    func signIn(email: String, password: String) {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if result != nil {
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
            }
            
            self.isLoading = false
        }
    }
    
    func register(email: String, password: String) {
        isLoading = true
        Auth.auth().createUser(withEmail: email,
                               password: password) { result, error in
            if result != nil {
                self.isLoggedIn = true
            } else {
                if let error = error {
                    BaseViewModel.shared.showMessage(type: .failed, message: error.localizedDescription)
                }
            }
            
            self.isLoading = false
        }
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                BaseViewModel.shared.showMessage(type: .failed, message: "Please enter an email")
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            BaseViewModel.shared.showMessage(type: .failed, message: "Could not log out")
        }
    }
    
    private func signIn(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if authResult != nil {
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
            }
        }
    }
}
