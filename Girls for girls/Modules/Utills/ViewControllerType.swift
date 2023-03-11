//
//  ViewControllerType.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit

enum ViewControllerType {
    case main
    case videoLessons
    case shop
    case profile
    
    var viewController: UIViewController { // Возврващаем Вью Контроллеры
        switch self {
        case .main:
            return MainViewController()
        case .videoLessons:
            return VideoLessonsViewController()
        case .shop:
            return ShopViewController()
        case .profile:
            return ProfileViewController()
        }
    }
    
    var title: String {  // название таб бара
        switch self {
        case .main:
            return "Главная"
        case .videoLessons:
            return "Менторство"
        case .shop:
            return "Магазин"
        case .profile:
            return "Профиль"
        }
    }
    
    var selectedImage: UIImage {  // картины
        switch self {
        case .main:
            return UIImage(named: "main") ?? UIImage()
        case .videoLessons:
            return UIImage(named: "mentoring") ?? UIImage()
        case .shop:
            return UIImage(named: "Vector-33") ?? UIImage()
        case .profile:
            return UIImage(named: "profile-2") ?? UIImage()
        }
    }
    
    var unSelectedImage: UIImage {   // нажатие картины
        switch self {
        case .main:
            return UIImage(named: "main") ?? UIImage()
        case .videoLessons:
            return UIImage(named: "mentoring") ?? UIImage()
        case .shop:
            return UIImage(named: "Vector-33") ?? UIImage()
        case .profile:
            return UIImage(named: "profile-2") ?? UIImage()
        }
    }
}
