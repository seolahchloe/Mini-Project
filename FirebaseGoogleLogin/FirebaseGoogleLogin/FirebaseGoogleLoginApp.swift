//
//  FirebaseGoogleLoginApp.swift
//  FirebaseGoogleLogin
//
//  Created by Chloe Chung on 2023/08/09.
//

import SwiftUI
import Firebase

@main
struct FirebaseGoogleLoginApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
