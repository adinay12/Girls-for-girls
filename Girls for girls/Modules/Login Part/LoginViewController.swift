//
//  LoginViewController.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
//

import UIKit
import SnapKit
import CocoaTextField
import SwiftyJSON

class LoginViewController: BaseViewController {

   
    
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
    
    private lazy var passwordIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "password")
        iv.isUserInteractionEnabled = true // наш обьект может быть нажат пользовотелям
        let secondTapped = UITapGestureRecognizer(target: self, action: #selector(passwordIconTapped))
        iv.addGestureRecognizer(secondTapped)
        return iv
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Пароль"
        tf.font = .systemFont(ofSize: 13, weight: .light)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(58)
        tf.delegate = self
        return tf
    }()
    
    private lazy var secureIconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "shape")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(shapeTapped))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var forgotPassLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgottenLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Забыли пароль?"
        lb.textAlignment = .center  //  где будет распологатся обьект
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.isUserInteractionEnabled = true
        let tappedForget = UITapGestureRecognizer(target: self, action: #selector(forgotPassTapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(tappedForget)  // привезали нажатие
        return lb
    }()
    
    private lazy var registrationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Зарегистрироваться"
        lb.textAlignment = .center  //  где будет распологатся обьект
        lb.textColor =  UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.isUserInteractionEnabled = true
        let tappedForget = UITapGestureRecognizer(target: self, action: #selector(registrasionTapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(tappedForget)  // привезали нажатие
        return lb
    }()
    
    let loginViewModel: LoginViewModel
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(mainImage)
        view.addSubview(firstLabel)
        view.addSubview(mainStackView)
        view.addSubview(emailImage)
        view.addSubview(passwordIconImage)
        view.addSubview(secureIconImage)
        view.addSubview(forgotPassLabel)
        view.addSubview(loginButton)
        view.addSubview(forgottenLabel)
        view.addSubview(registrationLabel)
        [emailTextField, passwordTextField].forEach {mainStackView.addArrangedSubview($0)}
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(95)
            $0.leading.trailing.equalToSuperview().inset(124)
            $0.height.equalTo(102)
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
        
        passwordIconImage.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.leading.equalTo(passwordTextField.snp.leading).offset(-72)
            $0.height.equalTo(18)
        }
        
        secureIconImage.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY)
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(32)
            $0.height.equalTo(18)
        }
        
        forgotPassLabel.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(18)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        forgottenLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(129)
            $0.height.equalTo(17)
        }
        
        registrationLabel.snp.makeConstraints {
            $0.top.equalTo(forgottenLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(114)
            $0.height.equalTo(17)
        }
    }
    
    
}


//    // MARK: - Selector

extension LoginViewController {  
    @objc func passwordIconTapped() {
        print("Пароль")
    }
    
    @objc func shapeTapped() {
        self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
        print("Проверка пароля")
    }
    
    @objc func loginTapped() {
        guard let email = emailTextField.text,  let password = passwordTextField.text  else {return}  // обезапосились от нила
        
        if !email.isEmpty && !password.isEmpty {   // проверка на пустоту
            loginViewModel.authorizationUser(email: email, password: password) { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(MainTabBarController(), animated: true)
                }
            }
        }
    }
    
    @objc func forgotPassTapped() {
        let vc = EmailViewController(emailViewModel: EmailViewModel())
        navigationController?.pushViewController(vc, animated: true)
        print("Забыли пароль")
    }
    
    @objc func registrasionTapped() {
        let vc =  SignUpViewController(viewModel: SignUpViewModel())
                navigationController?.pushViewController(vc, animated: true)
                print("Зарегистрироваться")

        }
    
    
    @objc func setupAlert() {
        let alertVC = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let imageAlert = UIImage(named: "error-1")
        let imageTitle = UIImageView(frame: CGRect(x: -10, y: -100, width: 305, height: 332))
        imageTitle.image = imageAlert
        alertVC.view.addSubview(imageTitle)
        self.present(alertVC, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            alertVC.dismiss(animated: true)
//            let vc = MainTabBarController()
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}



//if let url = URL(string: "tiktok://") {
//    UIApplication.shared.openURL(url)
//}


