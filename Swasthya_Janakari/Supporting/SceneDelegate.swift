//
//  SceneDelegate.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 8/25/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
       // let first = UINavigationController(rootViewController: firstVC(collectionViewLayout: layout)) //since this is a collection viewcontroller you need to pass layout also.
        //let second = UINavigationController(rootViewController: secondVC())
        
        let window = UIWindow(windowScene: scene)
        window.rootViewController = createTabbar()
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func createFirstNC() -> UINavigationController {
        //let layout = UICollectionViewFlowLayout()
        //let first = firstVC(collectionViewLayout: layout)
        let first = firstHomeScreen()
        first.title = "होम"
        first.tabBarItem = UITabBarItem(title: "होम", image: UIImage(named: "home"), tag: 0)
        return UINavigationController(rootViewController: first)
    }
    
    func createSecondNC() -> UINavigationController {
        let second = secondVC()
        //let second = SecondVCwithSegmentedControl()
        second.title = "होस्पितल"
        second.tabBarItem = UITabBarItem(title: "होस्पितल", image: UIImage(named: "hospital"), tag: 1)
        return UINavigationController(rootViewController: second)
    }
    
    func createThirdNC() -> UINavigationController {
        let third = thirdVC()
        third.title = "समाचार"
        third.tabBarItem = UITabBarItem(title: "समाचार", image: UIImage(named: "news"), tag: 2)
        return UINavigationController(rootViewController: third)
    }
    
    func createFourthNC() -> UINavigationController {
        let fourth = fourthVC()
        fourth.title = "अन्य मेनू"
        fourth.tabBarItem = UITabBarItem(title: "अन्य मेनू", image: UIImage(named: "menu"), tag: 3)
        return UINavigationController(rootViewController: fourth)
    }
    
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = UIColor.init(red: 0.33, green: 0.94, blue: 0.77, alpha: 1)
        tabbar.viewControllers = [createFirstNC(), createSecondNC(), createThirdNC(), createFourthNC()]
        return tabbar
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

