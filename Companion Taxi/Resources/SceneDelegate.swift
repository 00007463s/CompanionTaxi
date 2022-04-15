//
//  SceneDelegate.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit
import GoogleMaps
import FirebaseDatabase



struct Users: Codable, Equatable {
    let uid: String
    let phone: String
    let type: String
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var ref: DatabaseReference!
    var users = [Users]()
    var currentUser : Users!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
        let navbar = UINavigationController(rootViewController: MainViewController())
        navbar.isNavigationBarHidden = true
        GMSServices.provideAPIKey("AIzaSyAT5csjPUT2sQtaWBgy4eTqVkEo271XWp8")

        ref = Database.database().reference()
        
        ref.child("users").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            _ = snapshot.value as? String ?? "Unknown"
            self.users = self.getData(snapshot: snapshot)
            
            UserDefaults.standard.setValue(self.users.count, forKey: "usersCount")
            var isContain = ""
            for item in self.users {
                if item.uid == UIDevice.current.identifierForVendor!.uuidString{
                    isContain = "true"
                    self.currentUser = item
                    self.window?.rootViewController = TabbarViewController()
                    return
                }else{
                    isContain = "false"
                }
            }
  
           if isContain == "false" {
                self.window?.rootViewController = LanguageViewController()
            }
        })
    }
    
    func getData(snapshot: DataSnapshot) -> [Users]{

        let users = try! JSONDecoder().decode([Users].self, from: snapshot.listToJSON)
        print(users)
        
        return users
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

