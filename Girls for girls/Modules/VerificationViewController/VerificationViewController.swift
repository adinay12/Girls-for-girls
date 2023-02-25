//
//  VerificationViewController.swift
//  Girls for girls
//
//  Created by Adinay on 14/2/23.


import UIKit
import SnapKit

class VerificationViewController: BaseViewController {
    
//    var timer = Timer()  // обьект класса
//    var time = 60 {
//        didSet {
//            fifthLabel.text = "\(time)"  // Обновление таймера
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
        lb.text = "Верификация"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 36, weight: .semibold)
        
        return lb
        
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Введите код который мы отправили вам                  на +996 555454545"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .medium)
        lb.lineBreakMode = .byWordWrapping
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
        tf.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "-"
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
        tf.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "-"
        //        tf.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
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
        tf.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.placeholder = "-"
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
    
    private lazy var fourthTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tf.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        tf.placeholder = "-"
        tf.font = .systemFont(ofSize: 16, weight: .medium)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
//        tf.layer.borderWidth = 1
        tf.setLeftPaddingPoints(30)
        tf.delegate = self
        
//        tf.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        tf.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(60)
            
        }
        
        return tf
        
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Не получили код?"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.isUserInteractionEnabled = true
        
        let thirdLabel = UITapGestureRecognizer(target: self, action: #selector(thirdTapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(thirdLabel)  // привезали нажатие
        
        return lb
        //
    }()
    
    private lazy var fourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Отправить код повторно"
        lb.textAlignment = .left  //  где будет распологатся обьект
        lb.textColor = .red
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.numberOfLines = 0
        
        lb.isUserInteractionEnabled = true
        
        let fourthLabel = UITapGestureRecognizer(target: self, action: #selector(fourthTapped))  // coздание  нажатие на кнопку
        lb.addGestureRecognizer(fourthLabel)  // привезали нажатие
        
        return lb
    }()
    
//    private lazy var fifthLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "01:00"
//        lb.textColor = .red
//        lb.font = .systemFont(ofSize: 14, weight: .medium)
//        lb.numberOfLines = 0
//
//        lb.isUserInteractionEnabled = true
//
//        let fifthTapped = UITapGestureRecognizer(target: self, action: #selector(fifthTappedLabel))  // coздание  нажатие на кнопку
//        lb.addGestureRecognizer(fifthTapped)  // привезали нажатие
//
//        return lb
//    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(mainTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        view.addSubview(backImage)
        view.addSubview(mainLabel)
        view.addSubview(secondLabel)
        view.addSubview(mainStackView)
        view.addSubview(thirdLabel)
        view.addSubview(fourthLabel)
//        view.addSubview(fifthLabel)
        
        firstTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        secondTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        thirdTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        fourthTextField.addTarget(self, action: #selector(self.textdidChange(textfield: )), for: UIControl.Event.editingChanged)
        
        view.addSubview(mainButton)
        
        
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
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(137)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-31)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
        }
        
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(168)
        }
        
//        fifthLabel.snp.makeConstraints {
//            $0.top.equalTo(thirdLabel.snp.bottom).offset(4)
//            $0.leading.equalTo(fourthLabel.snp.leading).offset(144)
//        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(fourthLabel.snp.bottom).offset(206)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-58)
            $0.height.equalTo(54)
        }
    }
}



extension VerificationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
//    @objc func tick() {
//        time -= 1 // Уменьшаем на 1
//
//        if time == 0 {
//            timer.invalidate()
//            fourthLabel.text = "Отправить повторно"
//        }
        
    
    
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
                print("default")
            }
        }else {
            
        }
    }
    
    @objc func  thirdTapped() {
        print("код")
    }
    
    @objc func fourthTapped() {
        print("повтор")
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
        print("kkkkkkk")
    }
    
//    @objc func fourthTapped() {
//        time = 60
//        fourthLabel.text = "Отправить повторно"
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
//        print("Отправить повторно")
//    }
//
//    @objc func fifthTappedLabel() {
//        print("60")
//    }
    
    @objc func mainTapped() {
        showAlert()
        //        let vc = MainTabBarController()
        //        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showAlert() {
        let alertVC = UIAlertController(title: "", message: "", preferredStyle: .alert)
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        //        }
        //
        //        perform(#selector(showAlert),with: nil, afterDelay: 1 )
        
        let imageAlert = UIImage(named: "Happy")
        let imageTitle = UIImageView(frame: CGRect(x: -10, y: -120, width: 305, height: 332))
        imageTitle.image = imageAlert
        alertVC.view.addSubview(imageTitle)
        self.present(alertVC, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            alertVC.dismiss(animated: true)
            let vc = MainTabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
