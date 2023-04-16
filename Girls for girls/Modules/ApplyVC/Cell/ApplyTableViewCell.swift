//
//  ApplyTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 10/4/23.
//

import UIKit
import SnapKit

class ApplyTableViewCell: BaseTableViewCell {
    static let identifier = "ApplyTableViewCell"
    
    //MARK: Нажатие внутри ячейки ApplyTableViewCell через Замыкания
     
     var clickSend: (() -> Void )? = nil
    
//    let applyViewModel: ApplyViewModel
//    init(applyViewModel: ApplyViewModel) {
//        self.applyViewModel = applyViewModel
//        super.init()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 20
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Полное имя"
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
    
    private lazy var dateOfBirthTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Дата рождения"
        tf.keyboardType = UIKeyboardType.numberPad
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
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var addressTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Адрес"
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
    
    private lazy var workFormatTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Формат работы"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var motivationTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Мотивация"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var aboutMeTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Обо мне"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var achievementsTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Достижения"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var myFailsTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Мои неудачи"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var mySkillsTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Мои навыки"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
        tf.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return tf
    }()
    
    private lazy var mentorProgramIdTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "mentorProgramId: 0"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(18)
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
        button.addTarget(self, action: #selector(sendTap),for:.touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        contentView.addSubview(mainStackView)
        
        [fullNameTextField, dateOfBirthTextField, emailTextField, addressTextField, workFormatTextField, motivationTextField, aboutMeTextField, achievementsTextField, myFailsTextField, mySkillsTextField, mentorProgramIdTextField].forEach { mainStackView.addArrangedSubview($0)}

        contentView.addSubview(sendButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
}

extension ApplyTableViewCell {
    @objc func sendTap() {
//        clickSend?() 
        guard let fullName = fullNameTextField.text, let dateOfBirth = dateOfBirthTextField.text, let email = emailTextField.text, let address = addressTextField.text, let workFormat = workFormatTextField.text, let motivation = motivationTextField.text, let aboutMe = aboutMeTextField.text, let achievements = achievementsTextField.text, let myFails = myFailsTextField.text, let mySkills = mySkillsTextField.text, let mentorProgramId = mentorProgramIdTextField.text else { return }
    
        if !fullName.isEmpty && !dateOfBirth.isEmpty && !email.isEmpty && !address.isEmpty && !workFormat.isEmpty && !motivation.isEmpty && !aboutMe.isEmpty && !achievements.isEmpty && !myFails.isEmpty && !mySkills.isEmpty &&
            !mentorProgramId.isEmpty {
            
//            applyViewModel.postApplications(fullName: fullName, dateOfBirth: dateOfBirth, email: email, address: address, workFormat: workFormat, motivation: motivation, aboutMe: aboutMe, achievements: achievements, myFails: myFails, mySkills: myFails, mentorProgramId: mentorProgramId) { [weak self] in
                
//                DispatchQueue.main.async {
//                    self?.clickSend
//                }
            }
        }
    }
// }


extension ApplyTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//print("Отправить")



//    guard let fullName = fullNameTextField.text, let dateOfBirth = dateOfBirthTextField.text, let email = emailTextField.text, let address = addressTextField.text, let workFormat = workFormatTextField.text, let motivation = motivationTextField.text, let aboutMe = aboutMeTextField.text, let achievements = achievementsTextField.text, let myFails = myFailsTextField.text, let mySkills = mySkillsTextField.text, let mentorProgramId = mentorProgramIdTextField.text else { return }
//
//    if !fullName.isEmpty && !dateOfBirth.isEmpty && !email.isEmpty && !address.isEmpty && !workFormat.isEmpty && !motivation.isEmpty && !aboutMe.isEmpty && !achievements.isEmpty && !myFails.isEmpty && !mySkills.isEmpty &&
//        !mentorProgramId.isEmpty {
//
//            applyViewModel.postApplications(fullName: fullName, dateOfBirth: dateOfBirth, email: email, address: address, workFormat: workFormat, motivation: motivation, aboutMe: aboutMe, achievements: achievements, myFails: myFails, mySkills: myFails, mentorProgramId: mentorProgramId) { [weak self] in
//                DispatchQueue.main.async {
//                    appDelegate.na
//                }
//        }
//
//    }
