//
//  ChangePasswordViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/4/23.
//

import UIKit
import SnapKit

class ChangePasswordViewController: BaseViewController {
    
    let changePasswordViewModel: ChangePasswordViewModel
    init(changePasswordViewModel: ChangePasswordViewModel) {
        self.changePasswordViewModel = changePasswordViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var changePasswordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Изменить пароль"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 28, weight: .semibold)
        return lb
    }()
    
    private lazy var emailLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Электронная почта"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
        return tf
    }()
    
    private lazy var oldPasswordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Cтарый Пароль"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var oldPasswordTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
        return tf
    }()
    
    private lazy var newPasswordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Новый Пароль"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var newPasswordTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
        return tf
    }()
    
    private lazy var сonfirmPasswordLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Потвердить Пароль"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var сonfirmPassworTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
        return tf
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapSave), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(changePasswordLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(oldPasswordLabel)
        view.addSubview(oldPasswordTextField)
        view.addSubview(newPasswordLabel)
        view.addSubview(newPasswordTextField)
        view.addSubview(сonfirmPasswordLabel)
        view.addSubview(сonfirmPassworTextField)
        view.addSubview(saveButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(58)
            $0.leading.equalToSuperview().offset(18)
        }
        
        changePasswordLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(128)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(changePasswordLabel.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(32)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        oldPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
        }
        
        oldPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(oldPasswordLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        newPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(oldPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(128)
        }
        
        newPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(newPasswordLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        сonfirmPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(newPasswordTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(128)
        }
        
        сonfirmPassworTextField.snp.makeConstraints {
            $0.top.equalTo(сonfirmPasswordLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(сonfirmPassworTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
}


extension ChangePasswordViewController {
    @objc func imageTap() {
        navigationController?.popViewController(animated: true)
        print("back")
    }
    
    @objc func tapSave() {
        guard let email = emailTextField.text, let oldPassword = oldPasswordTextField.text, let newPassword = newPasswordTextField.text, let confirmNewPassword = сonfirmPassworTextField.text else { return }
        
        if !email.isEmpty && !oldPassword.isEmpty  && !newPassword.isEmpty, !confirmNewPassword.isEmpty {
            changePasswordViewModel.userPasswordChange(email: email, oldPassword: oldPassword, newPassword: newPassword, confirmNewPassword: confirmNewPassword) { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(ProfileViewController(), animated: true)
                }
            }
        }
        
        print("сохранить")
    }
}

//if !firstTextField.isEmpty && !secondTextField.isEmpty && !thirdTextField.isEmpty && !fourthTextField.isEmpty {
