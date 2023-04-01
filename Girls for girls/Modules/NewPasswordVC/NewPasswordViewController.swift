//
//  NewPasswordViewController.swift
//  Girls for girls
//
//  Created by Adinay on 14/2/23.
//

import UIKit
import SnapKit

class NewPasswordViewController: BaseViewController {
    
    var token: String? = nil
    
    let newPasswordViewModel: NewPasswordViewModel
    init(newPasswordViewModel: NewPasswordViewModel) {
        self.newPasswordViewModel = newPasswordViewModel
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
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(back))
        
        iv.addGestureRecognizer((imageTapped))
        
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Выберите новый \nпароль"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 32, weight: .semibold)
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Помогите обезопасить свою учетную \nзапись"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .medium)
        lb.numberOfLines = 0
        
        return lb
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var newPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Новый пароль"
        tf.font = .systemFont(ofSize: 14, weight: .medium)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(32)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Потвердите новый пароль"
        tf.font = .systemFont(ofSize: 14, weight: .medium)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(32)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Отправить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(mainStackView)
        view.addSubview(sendButton)
        
        [newPasswordTextField, confirmPasswordTextField].forEach {mainStackView.addArrangedSubview($0)}
        
    }
    
    
    override func setupConstrains() {
        super.setupConstrains()
        
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(62)
            $0.leading.equalToSuperview().offset(22)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(87)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(55)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
}



extension NewPasswordViewController {
    @objc func back() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
    
    @objc func sendTapped() {
        guard let password = newPasswordTextField.text,  let confirmPass = confirmPasswordTextField.text else { return }

        if !password.isEmpty && !confirmPass.isEmpty {
            
            newPasswordViewModel.postResetToken(token: token ?? "", password: password, confirmPass: confirmPass) { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(WelcomeViewController(), animated: true)
                }
            }
        }
    }
}


extension NewPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

