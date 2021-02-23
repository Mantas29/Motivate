//
//  MotivateApp.swift
//  Motivate
//
//  Created by T1001 on 2021-02-22.
//

import SwiftUI
import FBSDKCoreKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          
        FirebaseApp.configure()
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
          
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        ApplicationDelegate.shared.application(app,
                                               open: url,
                                               sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                               annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
}

@main
struct MotivateApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            BaseView()
                .onOpenURL(perform: { url in
                    handleFacebookURL(url: url)
                })
        }
    }
    
    private func handleFacebookURL(url: URL) {
        ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: [UIApplication.OpenURLOptionsKey.annotation])
    }
}

    
