//
//  ExtensionLabel.swift
//  Girls for girls
//
//  Created by Adinay on 10/4/23.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(title: String, textColor: UIColor, font: UIFont) {
        self.init(frame: .zero)
        self.text = title
        self.textColor = textColor
        self.font = font
    }
    
}


//extension UIButton {
//    convenience init()
//}


//private lazy var fourthLabel: UILabel = {
//    let lb = UILabel()
//    lb.text = "Войти"
//    lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
//    lb.font = .systemFont(ofSize: 14, weight: .medium)
//    lb.numberOfLines = 0
//
//    lb.isUserInteractionEnabled = true
//    let thirdTapped = UITapGestureRecognizer(target: self, action: #selector(fourtTapped))  // coздание  нажатие на кнопку
//    lb.addGestureRecognizer(thirdTapped)  // привезали нажатие
//
//    return lb
//}()
