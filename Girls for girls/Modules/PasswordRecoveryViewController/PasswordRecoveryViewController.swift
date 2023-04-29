//
//  PasswordRecoveryViewController.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
//

import UIKit
import SnapKit

class PasswordRecoveryViewController: BaseViewController {
    
    let passwordRecoveryViewModel: PasswordRecoveryViewModel
    init(passwordRecoveryViewModel: PasswordRecoveryViewModel) {
        self.passwordRecoveryViewModel = passwordRecoveryViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    var timer = Timer()  // обьект класса
//    var time = 60 {
//        didSet {
//            sixthLabel.text = "\(time)"  // Обновление таймера
//        }
//    }
    
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
        lb.text = "Восстановления"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 32, weight: .semibold)
        
        return lb
        
    }()
    
    private lazy var secondabel: UILabel = {
        let lb = UILabel()
        lb.text = "пароля"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 32, weight: .semibold)
        
        return lb
        
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Введите код который мы отправили вам \nна почту"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .medium)
        lb.numberOfLines = 0
        
        return lb
        
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var firstTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 0.8)
        tf.textColor = .white
        tf.placeholder = "-"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.font = .systemFont(ofSize: 16, weight: .medium)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(30)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(60)
            
        }
        return tf
    }()
    
    private lazy var secondTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 0.8)
        tf.textColor = .white
        tf.placeholder = "-"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.font = .systemFont(ofSize: 16, weight: .medium)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(30)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(60)
            
        }
        return tf
    }()
    
    private lazy var thirdTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 0.8)
        tf.textColor = .white
        tf.placeholder = "-"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.font = .systemFont(ofSize: 13, weight: .light)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(30)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(60)
            
        }
        return tf
    }()
    
    private lazy var fourthTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.textColor = .systemPink
        tf.placeholder = "-"
        tf.keyboardType = UIKeyboardType.numberPad
        tf.font = .systemFont(ofSize: 13, weight: .light)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(30)
        tf.delegate = self
        
        tf.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(60)
        }
        
        return tf
    }()
    
    private lazy var fourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Не получили код?"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.numberOfLines = 0
        lb.isUserInteractionEnabled = true
        let fourthTapped = UITapGestureRecognizer(target: self, action: #selector(Tapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(fourthTapped)  // привезали нажатие
        
        return lb
    }()
    
//    private lazy var fifthLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "Отправить код повторно"
//        lb.textAlignment = .left  //  где будет распологатся обьект
//        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        lb.font = .systemFont(ofSize: 14, weight: .medium)
//        lb.numberOfLines = 0
//
//        lb.isUserInteractionEnabled = true
//
//        let fifthTapped = UITapGestureRecognizer(target: self, action: #selector(labelImageTapped))  // coздание  нажатие на кнопку
//        lb.addGestureRecognizer(fifthTapped)  // привезали нажатие
//
//        return lb
//    }()
    
//    private lazy var sixthLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "01:00"
//        //        lb.textAlignment = .left  //  где будет распологатся обьект
//        lb.textColor = .red
//        lb.font = .systemFont(ofSize: 14, weight: .medium)
//        lb.numberOfLines = 0
//
//        lb.isUserInteractionEnabled = true
//
//        let sixthTapped = UITapGestureRecognizer(target: self, action: #selector(sixthLabelTapped))  // coздание  нажатие на кнопку
//        lb.addGestureRecognizer(sixthTapped)  // привезали нажатие
//
//        return lb
//
    
    private lazy var restoreButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.numberOfLines = 0
        if #available(iOS 15.0, *) {
            button.subtitleLabel?.numberOfLines = 0
        } else {
            // Fallback on earlier versions
        }
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(restoreTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mainLabel)
        view.addSubview(secondabel)
        view.addSubview(thirdLabel)
        view.addSubview(mainStackView)
        
        firstTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        secondTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        thirdTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        fourthTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        view.addSubview(fourthLabel)
//        view.addSubview(fifthLabel)
//        view.addSubview(sixthLabel)
        
        view.addSubview(restoreButton)
        
        
        [firstTextField, secondTextField, thirdTextField, fourthTextField].forEach {mainStackView.addArrangedSubview($0)}
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstTextField.becomeFirstResponder()
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(62)
            $0.leading.equalToSuperview().offset(18)
            $0.height.equalTo(14)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(87)
        }
        
        secondabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(272)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-31)
        }
        
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(210)
        }
        
//        fifthLabel.snp.makeConstraints {
//            $0.top.equalTo(fourthLabel.snp.bottom).offset(4)
//            $0.leading.equalToSuperview().offset(16)
//            $0.trailing.equalToSuperview().offset(168)
//        }
        
//        sixthLabel.snp.makeConstraints {
//            $0.top.equalTo(fourthLabel.snp.bottom).offset(4)
//            $0.leading.equalTo(fifthLabel.snp.leading).offset(144)
//        }
        
        restoreButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(84)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
    }
    
    override func setupValues() {
        super.setupValues()
    
}
}
extension PasswordRecoveryViewController {
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
        print("Назад")
    }
    
    @objc func Tapped() {
        print("Не получили код?")
    }
    
//    @objc func labelImageTapped() {
//        print("Отправить код повторно")
//    }
    
    @objc func restoreTapped() {
        guard let firstTextField = firstTextField.text, let secondTextField = secondTextField.text, let thirdTextField = thirdTextField.text, let fourthTextField = fourthTextField.text else { return }
        
        if !firstTextField.isEmpty && !secondTextField.isEmpty && !thirdTextField.isEmpty && !fourthTextField.isEmpty {
            passwordRecoveryViewModel.getPasswordResert(token: "") { token in
                let vc = NewPasswordViewController(newPasswordViewModel: NewPasswordViewModel())
                vc.token = token
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    
//    @objc func qwe() {
//    if firstTextField.text == "0" && secondTextField.text == "0" && thirdTextField.text == "0" && fourthTextField.text == "0" {
//        thirdLabel.text = "Не получили код"
//    } else {
//        restoreButton.setTitle("вы неправильно ввели код.\nУбедитесь что код правильный", for: .normal)
//    }
//    }
    
    
    
    
//    @objc func  labelImageTapped() {
//        time = 60
//        fifthLabel.text = "Отправить повторно"
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
//        print("Отправить повторно")
//    }
//
//    @objc func sixthLabelTapped() {
//        print("01:00")
//    }
    
}


extension PasswordRecoveryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }



//    var errorOne = "0000"
//    var error = "вы неправильно ввели код.\nУбедитесь что код правильный"
    
//    @objc func tick() {
//       time -= 1 // Уменьшаем на 1
//
//        if time == 0 {
//            timer.invalidate()
//            fifthLabel.text = "Отправить повторно"
//        }
        
 //   }
    
    @objc func textdidChange(textfield:UITextField) {
        let text = textfield.text
        if text?.utf16.count == 1 {
            switch textfield {
            case firstTextField:
                secondTextField.becomeFirstResponder()
                break
            case secondTextField:
                thirdTextField.becomeFirstResponder()
                break
            case thirdTextField:
                fourthTextField.becomeFirstResponder()
                break
            case fourthTextField:
                fourthTextField.becomeFirstResponder()
                break
            case firstTextField:
                secondTextField.resignFirstResponder()
                break
            default:
                print("asd")
            }
        }else {
            
        }
    }
}
