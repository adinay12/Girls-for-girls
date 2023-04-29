//
//  ConferencesViewController.swift
//  Girls for girls
//
//  Created by Adinay on 17/4/23.
//

import UIKit
import SnapKit

class ConferencesViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(tapBack))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var conferencesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Конференции"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var roleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Роль девушек в новом мире"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 24, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Приглашаем вас на конференцию 12-мая, в \nПОИСКАХ НОВЫХ ВОЗМОЖНОСТЕЙ:НА ЧТО СПОСОБНЫ \nдевушки, КОГДА ЭКОНОМИКУ И ОБЩЕСТВО \n«ШТОРМИТ»."
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.518, green: 0.518, blue: 0.533, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "Image-2")
        return iv
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Подать заявку", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapApply), for: .touchUpInside)
        return button
    }()
    
    private lazy var conferenceProgramImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Frame 3")
        iv.isUserInteractionEnabled = true
        let conferenceTap = UITapGestureRecognizer(target: self, action: #selector(conferenceProgramTap))
        iv.addGestureRecognizer((conferenceTap))
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(conferencesLabel)
        view.addSubview(roleLabel)
        view.addSubview(mainLabel)
        view.addSubview(mainImage)
        view.addSubview(applyButton)
        view.addSubview(conferenceProgramImage)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            $0.leading.equalToSuperview().offset(20)
        }
        
        conferencesLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(backImage.snp.trailing).offset(100)
        }
        
        roleLabel.snp.makeConstraints {
            $0.top.equalTo(conferencesLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(roleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(274)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        conferenceProgramImage.snp.makeConstraints {
            $0.top.equalTo(applyButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
}



// MARK: - Selector

extension ConferencesViewController {
    @objc func tapBack() {
        navigationController?.popViewController(animated: true)
        print("Назад")
    }
    
    @objc func tapApply() {
        print("Подать заявку")
    }
    
    @objc func conferenceProgramTap() {
        let vc = ConferenceProgramViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Программа конференции")
    }
}
