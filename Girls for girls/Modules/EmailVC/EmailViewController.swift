//
//  EmailViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/3/23.
//

import UIKit
import SnapKit
import Localize_Swift

class EmailViewController: BaseViewController {
    
    let emailViewModel: EmailViewModel
    init(emailViewModel: EmailViewModel) {
        self.emailViewModel = emailViewModel
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
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(backTap))
        
        iv.addGestureRecognizer((imageTap))
        
        return iv
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "1_main logo 1")
        
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Вход"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 36, weight: .semibold)
        lb.textAlignment = .left
        
        return lb
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var emailImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Email")
        
        return iv
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Электронная почта"
        tf.font = .systemFont(ofSize: 13, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(54)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return tf
        
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Восстановить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(restoreTap), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainImage)
        view.addSubview(firstLabel)
        view.addSubview(mainStackView)
        view.addSubview(emailImage)
        view.addSubview(loginButton)
        
        [emailTextField].forEach {mainStackView.addArrangedSubview($0)}
    }
    
    
    override func setupConstrains() {
        super.setupConstrains()
        
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(62)
            $0.leading.equalToSuperview().offset(18)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(95)
            $0.leading.trailing.equalToSuperview().inset(124)
            $0.height.equalTo(101)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(271)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        emailImage.snp.makeConstraints {
            $0.centerY.equalTo(emailTextField.snp.centerY)
            $0.leading.equalTo(emailTextField.snp.leading).inset(28)
            $0.height.equalTo(18)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
}


extension EmailViewController {
    @objc func restoreTap() {
        guard let email = emailTextField.text else { return }
        
        if !email.isEmpty {
            emailViewModel.postForgotEmail(email: email) { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(PasswordRecoveryViewController(passwordRecoveryViewModel: PasswordRecoveryViewModel()), animated: true)
                }
            }
        }
    }
    
    @objc func backTap() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
}


extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
