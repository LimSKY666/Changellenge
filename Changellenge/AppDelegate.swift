//
//  AppDelegate.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let userDefaults = UserDefaults.standard
        let launchTime = Int(Date().timeIntervalSince1970)
        let cache = URLCache.shared
        
        if launchTime - userDefaults.integer(forKey: "cacheTime") > 3600 {
            cache.removeAllCachedResponses()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

