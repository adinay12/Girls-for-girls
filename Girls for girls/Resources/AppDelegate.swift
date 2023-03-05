//
//  AppDelegate.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        loginPart()
        
        window .makeKeyAndVisible() // показывает все что мы внего закидуем
        
        return true
    }
    
    // Функция для того что бы  Зарегистрироваться
    
    func loginPart() {
        navController(vc: LoginViewController())
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
