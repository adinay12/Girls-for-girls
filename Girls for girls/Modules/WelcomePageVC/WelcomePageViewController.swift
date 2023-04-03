//
//  WelcomePageViewController.swift
//  Girls for girls
//
//  Created by Adinay on 3/4/23.
//

import UIKit
import SnapKit

class WelcomePageViewController: BaseViewController {
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Group 238298-3")
        
        return iv
    }()
    
    private lazy var comeinImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Button")
        iv.isUserInteractionEnabled = true
        
        let forumsTapped = UITapGestureRecognizer(target: self, action: #selector(comeinTap))
        iv.addGestureRecognizer((forumsTapped))
        
        return iv
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(comeinTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(mainImage)
        view.addSubview(comeinImage)
        view.addSubview(secondButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(158)
            $0.trailing.leading.equalToSuperview().inset(124)
        }
        
        comeinImage.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(52)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        secondButton.snp.makeConstraints {
            $0.top.equalTo(comeinImage.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
}



extension WelcomePageViewController {
    @objc func comeinTap() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
        print("Войти как гость")
    }
    
    @objc func comeinTapped() {
        let vc = OnboardingViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Войти")
    }
}
