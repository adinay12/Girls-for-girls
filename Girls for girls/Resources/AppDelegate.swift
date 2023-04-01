//
//  AppDelegate.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    var user = false

    var window: UIWindow?
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        loginPart()
        
        window .makeKeyAndVisible() // показывает все что мы внего закидуем
        
        return true
    }
    // Функция для того что бы  Зарегистрироваться
    func loginPart() {
        navController(vc: LoginViewController(loginViewModel: LoginViewModel()))
        self.window?.rootViewController = navController // Вызываем функцию navController
    }
    func mainPart() {
        navController(vc: MainTabBarController())
        self.window?.rootViewController = navController // Вызываем функцию navController
    }
    
    func navController(vc: UIViewController){
        navController = UINavigationController(rootViewController:  vc)
        navController.navigationBar.isHidden = true
    }
}
