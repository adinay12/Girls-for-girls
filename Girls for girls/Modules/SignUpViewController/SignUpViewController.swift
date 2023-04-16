//
//  SignUpViewController.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
//

import UIKit
import SnapKit
import Lottie

class SignUpViewController: BaseViewController {
    
    let viewModel: SignUpViewModel
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
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
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Регистрация"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 36, weight: .semibold)
        return lb
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Имя и Фамилия"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.delegate = self
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var numberFoneTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Номер телефона"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.delegate = self
        return tf
    }()
    
    private lazy var emailTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Электронная почта"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.delegate = self
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Пароль"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.delegate = self
        return tf
    }()
    
    private lazy var confirmpasswordTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Подтвердить пароль"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        return tf
    }()
    
    private lazy var regionTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Регион"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        return tf
    }()
    
    private lazy var doneHeart: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Vector-30")
        iv.isUserInteractionEnabled = true
        let doneImage = UITapGestureRecognizer(target: self, action: #selector(doneTapped))
        iv.addGestureRecognizer((doneImage))
        return iv
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Я согласен с условиями \nпользовательского соглашения"
        lb.textColor =   UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.numberOfLines = 0
        return lb
        
    }()
    
    private lazy var furtherButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(furtherTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Уже есть аккаунт?"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.numberOfLines = 0
        lb.isUserInteractionEnabled = true
        let thirdTapped = UITapGestureRecognizer(target: self, action: #selector(labelTapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(thirdTapped)  // привезали нажатие
        return lb
    }()
    
    private lazy var fourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Войти"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.numberOfLines = 0
        lb.isUserInteractionEnabled = true
        let thirdTapped = UITapGestureRecognizer(target: self, action: #selector(fourtTapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(thirdTapped)  // привезали нажатие
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainLabel)
        view.addSubview(mainStackView)
        view.addSubview(doneHeart)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(fourthLabel)
        view.addSubview(furtherButton)
        
        [nameTextField, numberFoneTextField, emailTextField, passwordTextField, confirmpasswordTextField, regionTextField].forEach {mainStackView.addArrangedSubview($0)}
    }
    
    override func setupValues() {
        super.setupValues()
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(62)
            $0.leading.equalToSuperview().offset(16)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(128)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        doneHeart.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(18)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(16)
            $0.leading.equalTo(doneHeart.snp.trailing).offset(12)
        }
        
        furtherButton.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(furtherButton.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(120)
        }
        
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(furtherButton.snp.bottom).offset(16)
            $0.trailing.equalTo(thirdLabel.snp.trailing).offset(-1)
        }
    }
}


extension SignUpViewController {
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
    
    @objc func furtherTapped() {
        guard let firstName = nameTextField.text, let lastName = nameTextField.text, let phoneNumber = numberFoneTextField.text, let email = emailTextField.text,  let password = passwordTextField.text, let confirmPass = confirmpasswordTextField.text, let region = regionTextField.text else  { return }
        
        if !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPass.isEmpty && !region.isEmpty {
            
            viewModel.registerUser(email: email, firstName: firstName, lastName: lastName, password: password, confirmPass: confirmPass, region_id: region, phoneNumber: phoneNumber) { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(VerificationViewController(viewModelVerification: VerificationViewModel()), animated: true)
                }
            }
        }
    }
    
    @objc func doneTapped() {
        print("Сделано")
    }
    
    @objc func labelTapped() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
        print("Уже есть аккаунт")
    }
    
    @objc func fourtTapped() {
        let vc = MainTabBarController()
        navigationController?.pushViewController(vc, animated: true)
        print("Войти")
    }
}



extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
