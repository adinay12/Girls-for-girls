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
    case mentoring
    case shop
    case profile
    
    var viewController: UIViewController { // Возврващаем Вью Контроллеры
        switch self {
        case .main:
            return MainViewController()
        case .videoLessons:
            return VideoLessonsViewController()
        case .mentoring:
            return MetoringViewController()
        case .shop:
            return ShopViewController()
        case .profile:
            return ProfileViewController()
        }
    }
    
    var title: String {  // название таб бара
        switch self {
        case .main :
            return "Главная"
        case .videoLessons:
            return "Видеоуроки"
        case .mentoring:
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
            return UIImage(named: "Vector-35") ?? UIImage().withTintColor(UIColor(red: 0.161, green: 0.176, blue: 0.196, alpha: 1))
        case .videoLessons:
            return UIImage(named: "video-play-2") ?? UIImage().withTintColor(UIColor(red: 0.161, green: 0.176, blue: 0.196, alpha: 1))
        case .mentoring:
            return UIImage(named: "mentoring-1") ?? UIImage().withTintColor(UIColor(red: 0.161, green: 0.176, blue: 0.196, alpha: 1))
        case .shop:
            return UIImage(named: "Vector-33") ?? UIImage().withTintColor(UIColor(red: 0.161, green: 0.176, blue: 0.196, alpha: 1))
        case .profile:
            return UIImage(named: "frame-1") ?? UIImage().withTintColor(UIColor(red: 0.161, green: 0.176, blue: 0.196, alpha: 1))
        }
    }
    
    var unSelectedImage: UIImage {   // нажатие картины
        switch self {
        case .main:
            return UIImage(named: "Vector-35") ?? UIImage().withTintColor(UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1))
        case .videoLessons:
            return UIImage(named: "video-play-2") ?? UIImage().withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        case .mentoring:
            return UIImage(named: "mentoring-1") ?? UIImage().withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        case .shop:
            return UIImage(named: "Vector-33") ?? UIImage().withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        case .profile:
            return UIImage(named: "frame-1") ?? UIImage().withTintColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        }
    }
}
