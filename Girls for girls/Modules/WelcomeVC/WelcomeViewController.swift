//
//  WelcomeViewController.swift
//  Girls for girls
//
//  Created by Adinay on 14/2/23.
//

import UIKit
import SnapKit

class WelcomeViewController: BaseViewController {
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Frame 38")
        
        return iv
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(mainImage)
        view.addSubview(continueButton)
    }
    
    
    override func setupConstrains() {
        super.setupConstrains()
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(106)
            $0.leading.trailing.equalToSuperview().inset(54)
        }
        
        continueButton.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
    }
}


extension WelcomeViewController {
    @objc func continueTapped() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
