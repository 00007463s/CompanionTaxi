//
//  TabbarViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if #available(iOS 15, *) {
              let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
                 tabBarAppearance.configureWithOpaqueBackground()
                  tabBarAppearance.backgroundColor = .black
                  UITabBar.appearance().standardAppearance = tabBarAppearance
                  UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
          }
        self.tabBar.tintColor = UIColor.init(hexString: "#E9932F")
        UITabBar.appearance().barTintColor = .black
        
        // Create Tab one
        let navBar = UINavigationController(rootViewController: MainViewController())
        navBar.isNavigationBarHidden = true
        let tabOne = navBar
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "Combined-Shape"), selectedImage: UIImage(named: "Combined-Shape"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = RequestViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "", image: UIImage(named: "Combined-Shape-2"), selectedImage: UIImage(named: "Combined-Shape-2"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        let tabThree = HistoryViewController()
        let tabTwoBarItem3 = UITabBarItem(title: "", image: UIImage(named: "Menu"), selectedImage: UIImage(named: "Menu"))
        
        tabThree.tabBarItem = tabTwoBarItem3
        
        let tabFour = AccountViewController()
        let tabTwoBarItem4 = UITabBarItem(title: "", image: UIImage(named: "Combined-Shape-1"), selectedImage: UIImage(named: "Combined-Shape-1"))
        
        tabFour.tabBarItem = tabTwoBarItem4
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
        
    }
}
