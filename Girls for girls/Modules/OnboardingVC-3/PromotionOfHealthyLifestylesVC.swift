//
//  PromotionOfHealthyLifestylesVC.swift
//  Girls for girls
//
//  Created by Adinay on 2/4/23.
//

import UIKit
import SnapKit

class PromotionOfHealthyLifestylesVC: BaseViewController {
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Frame 67 1")
        
        return iv
    }()
    
    private lazy var swipeImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "loading- 3")
        
        return iv
    }()
    
    private lazy var womenLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Пропаганда здорового \nобраза жизни"
        lb.textColor = UIColor(red: 0.275, green: 0.114, blue: 0.553, alpha: 1)
        lb.font = .systemFont(ofSize: 26, weight: .regular)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        
        return lb
    }()
    
    private lazy var systemLabel: UILabel = {
        let lb = UILabel()
        lb.text = "В том числе психического и \nрепродуктивного здоровья."
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
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
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            $0.leading.trailing.equalToSuperview().inset(102)
        }
        
        swipeImage.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(34)
            $0.leading.trailing.equalToSuperview().inset(158)
        }
        
        womenLabel.snp.makeConstraints {
            $0.top.equalTo(swipeImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        systemLabel.snp.makeConstraints {
            $0.top.equalTo(womenLabel.snp.bottom).offset(24)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(systemLabel.snp.bottom).offset(24)
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


extension PromotionOfHealthyLifestylesVC {
    @objc func continueImageTap() {
        let vc = LoginViewController(loginViewModel: LoginViewModel())
        navigationController?.pushViewController(vc, animated: true)
        print("Продолжить")
    }
    
    @objc func skipTapped() {
        let vc = LoginViewController(loginViewModel: LoginViewModel())
        navigationController?.pushViewController(vc, animated: true)
        print("Пропустить")
    }
}