//
//  AppDelegate.swift
//  Yummie
//
//  Created by nassermac on 8/9/23.
//  Copyright © 2023 Nasser Co. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainStoryBoard = UIStoryboard(name: StoryBoards.main, bundle: nil)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        handleRoot()
        setUpNavigationBar()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
             return true
    }
    
    
// MARK: - Private Methods .
    private func setUpNavigationBar(){
        // to hide navigationBar .
        UINavigationBar.appearance().setBackgroundImage(UIImage(),for:.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .black
    }

    private func handleRoot(){
        if let loggedScreen = UserDefaults.standard.object(forKey: UserDefaultsKeys.isLoggedIn) as? Bool{
            if loggedScreen{
             goToHome()
            }else{
            goToOnboarding()
            }
        }
    }
    private func goToHome(){
        let home = mainStoryBoard.instantiateViewController(withIdentifier: Views.home) as! homeVC
        let navigationController = UINavigationController(rootViewController: home)
        self.window?.rootViewController = navigationController
    }
    private func goToOnboarding(){
        let onbording = mainStoryBoard.instantiateViewController(withIdentifier: Views.onboarding) as! OnboardingViewController
        let navigationController = UINavigationController(rootViewController: onbording)
        self.window?.rootViewController = navigationController
    }
    
}
