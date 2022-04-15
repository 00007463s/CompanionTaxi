//
//  AppDelegate.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = UIColor.init(hexString: "#E9932F")
        UITabBar.appearance().isTranslucent = true
        IQKeyboardManager.shared.enable = true
        GMSServices.provideAPIKey("AIzaSyAT5csjPUT2sQtaWBgy4eTqVkEo271XWp8")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
     
    }


}

