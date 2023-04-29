//
//  MentoringProgramForGirlsVC.swift
//  Girls for girls
//
//  Created by Adinay on 2/4/23.
//

import UIKit
import SnapKit

class MentoringProgramForGirlsVC: BaseViewController {
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Group 16449")
        
        return iv
    }()
    
    private lazy var swipeImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "loading- 2")
        
        return iv
    }()
    
    private lazy var womenLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Программа менторства \nдля девушек"
        lb.textColor = UIColor(red: 0.274, green: 0.113, blue: 0.554, alpha: 1)
        lb.font = .systemFont(ofSize: 24, weight: .regular)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        
        return lb
    }()
    
    private lazy var systemLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Менторство поможет поставить личные \nпрофессиональные цели и  достичь их"
        lb.textColor = UIColor(red: 0.217, green: 0.217, blue: 0.217, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        
        return lb
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor =  UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(continueImageTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Пропустить"
        lb.textColor = UIColor(red: 0.274, green: 0.113, blue: 0.554, alpha: 1)
        lb.font = .systemFont(ofSize: 17, weight: .medium)
        lb.textAlignment = .center
        lb.isUserInteractionEnabled = true
        
        let tappedForget = UITapGestureRecognizer(target: self, action: #selector(skipTapped))
        lb.addGestureRecognizer(tappedForget)
        
        return lb
    }()
    
    private lazy var ellipseImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Ellipse 4")
        
        return iv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(mainImage)
        view.addSubview(swipeImage)
        view.addSubview(womenLabel)
        view.addSubview(systemLabel)
        view.addSubview(mainButton)
        view.addSubview(mainLabel)
        view.addSubview(ellipseImage)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(68)
            $0.leading.trailing.equalToSuperview().inset(60)
        }
        
        swipeImage.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(158)
        }
        
        womenLabel.snp.makeConstraints {
            $0.top.equalTo(swipeImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(72)
        }
        
        systemLabel.snp.makeConstraints {
            $0.top.equalTo(womenLabel.snp.bottom).offset(14)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(systemLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(54)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(mainButton.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(138)
        }
        
        ellipseImage.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
        }
    }
}


extension MentoringProgramForGirlsVC {
    @objc func continueImageTap() {
        let vc = PromotionOfHealthyLifestylesVC()
        navigationController?.pushViewController(vc, animated: true)
        print("Продолжить")
    }
    
    @objc func skipTapped() {
        let vc = LoginViewController(loginViewModel: LoginViewModel())
        navigationController?.pushViewController(vc, animated: true)
        print("Пропустить")
    }
}
