//
//  MainTabBarController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
        
    }
    
    func setupTabBarAppearance(){
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)  // покрасили цвет tabBara
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 0.6)
        
    }
    
    
    // массив из Вью Контроллеров
    
    func setupViewControllers() {
        self.setViewControllers([
            setupCurrentViewController(viewControllerType:.main),
            setupCurrentViewController(viewControllerType: .videoLessons),
            setupCurrentViewController(viewControllerType: .shop),
            setupCurrentViewController(viewControllerType: .profile)
        ], animated: true)
    }
    
    
    // функция для Енума viewControllerType
    
    func setupCurrentViewController(viewControllerType: ViewControllerType) -> UIViewController {
        let vc = viewControllerType.viewController
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unSelectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage  // активное нажатие
        
        return vc
        
    }
}

