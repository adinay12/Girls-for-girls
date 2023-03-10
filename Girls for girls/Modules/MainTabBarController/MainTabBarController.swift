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
//        self.tabBar.layer.backgroundColor =
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .white
//        self.selectedIndex = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        self.tabBar.tintColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)  // покрасили цвет tabBara
        self.tabBar.unselectedItemTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
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

extension UITabBarController {
}
