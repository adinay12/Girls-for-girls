//
//  ProfileViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit
import SnapKit

class ProfileViewController: BaseViewController {
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Мой профиль"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        
        
        return lb
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Привет,  Имя!"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.numberOfLines = 0
       
        
        return lb
    }()
    
    private lazy var profileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "profile")
        
        return iv
    }()
    
    private lazy var dataButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.757, green: 0.573, blue: 0.933, alpha: 1)
        button.setTitle("Редактировать свои данные", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.titleLabel?.numberOfLines = 0
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(editYourDetails), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forumsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "forums")
        iv.isUserInteractionEnabled = true
        
        let forumsTapped = UITapGestureRecognizer(target: self, action: #selector(forumsTap))
        iv.addGestureRecognizer((forumsTapped))
        
        return iv
    }()
    
    private lazy var trainingsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "trainings")
        iv.isUserInteractionEnabled = true
        
        let trainingsTapped = UITapGestureRecognizer(target: self, action: #selector(trainingsTap))
        iv.addGestureRecognizer((trainingsTapped))
        
        return iv
    }()
    
    private lazy var basketImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "basket")
        iv.isUserInteractionEnabled = true
        
        let basketTapped = UITapGestureRecognizer(target: self, action: #selector(basketTap))
        iv.addGestureRecognizer((basketTapped))
        
        return iv
    }()
    
    private lazy var orderHistoryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Истории заказов"
        lb.textColor = UIColor(red: 0.757, green: 0.573, blue: 0.933, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .medium)
        
        lb.isUserInteractionEnabled = true
        let orderHistoryTapped = UITapGestureRecognizer(target: self, action: #selector(orderHistoryTap))
        lb.addGestureRecognizer(orderHistoryTapped)
        
        return lb
    }()
    
    private lazy var shoppingbagImage:  UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "shopping-bag")
        iv.isUserInteractionEnabled = true
        
        let shoppingTapped = UITapGestureRecognizer(target: self, action: #selector(shoppingTap))
        iv.addGestureRecognizer(shoppingTapped)
        
        return iv
    }()
    
    private lazy var studyPlanImage:  UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "studyPlan")
        iv.isUserInteractionEnabled = true
        
        let studyPlanTapped = UITapGestureRecognizer(target: self, action: #selector(studyPlanTap))
        iv.addGestureRecognizer(studyPlanTapped)
        
        return iv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(profileImage)
        view.addSubview(dataButton)
        view.addSubview(forumsImage)
        view.addSubview(trainingsImage)
        view.addSubview(basketImage)
        view.addSubview(orderHistoryLabel)
        view.addSubview(shoppingbagImage)
        view.addSubview(studyPlanImage)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.trailing.leading.equalToSuperview().inset(150)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(140)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(142)
            $0.leading.equalToSuperview().offset(32)
        }
        
        dataButton.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(46)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(36)
        }
        
        forumsImage.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(32)
        }
        
        trainingsImage.snp.makeConstraints {
            $0.top.equalTo(dataButton.snp.bottom).offset(56)
            $0.trailing.equalToSuperview().offset(-32)
        }
        
        basketImage.snp.makeConstraints {
            $0.top.equalTo(forumsImage.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
        }
        
        orderHistoryLabel.snp.makeConstraints {
            $0.top.equalTo(trainingsImage.snp.bottom).offset(26)
            $0.leading.equalTo(basketImage.snp.trailing).offset(90)
        }
        
        shoppingbagImage.snp.makeConstraints {
            $0.top.equalTo(trainingsImage.snp.bottom).offset(24)
            $0.leading.equalTo(orderHistoryLabel.snp.trailing).offset(6)
        }
        
        studyPlanImage.snp.makeConstraints {
            $0.top.equalTo(basketImage.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(44)
        }
    }
}


extension ProfileViewController {
    @objc func editYourDetails() {
        print("Редактировать свои данные")
    }
    
    @objc func forumsTap() {
        let vc = ForumsViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Форумы")
    }
    
    @objc func trainingsTap() {
        let vc = TrainingsViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Тренинги")
    }
    
    @objc func basketTap() {
        print("Корзина")
    }
    
    @objc func orderHistoryTap() {
        print("Истории заказов")
    }
    
    @objc func shoppingTap() {
        print("Корзина2")
    }
    
    @objc func studyPlanTap() {
        print("Перейти в study plan")
    }
}
