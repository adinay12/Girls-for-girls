//
//  ProfileSettingsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 12/4/23.
//

import UIKit
import SnapKit

class ProfileSettingsViewController: BaseViewController {
    
    let regions = ["Чуйская область",
                   "Город Бишкек",
                   "Таласская область",
                   "Иссык-Кульская область",
                   "Нарынская область",
                   "Джалал-Абадская область",
                   "Ошская область",
                   "Город Ош",
                   "Баткенская область"]
    
    let profileSettingsViewModel: ProfileSettingsViewModel
    init(profileSettingsViewModel: ProfileSettingsViewModel) {
        self.profileSettingsViewModel = profileSettingsViewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(back))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var profileSettingsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Настройки профиля"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "unsplash_hhcFGCGWQMY-3")
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Айканыш Садыкова"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        return lb
    }()
    
    private lazy var cityLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Кыргызстан, Бишкек"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .medium)
        return lb
    }()
    
    private lazy var fullNameabel: UILabel = {
        let lb = UILabel()
        lb.text = "Имя и Фамилия"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = "Садыкова Айканыш"
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
        //        tf.delegate = self
        return tf
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Электронная почта"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var dateOfBirthTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
  //    tf.delegate = self
        return tf
    }()
    
//    private lazy var datePicker: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        return datePicker
//    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Телефонный номер"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var phoneNumberTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .semibold)
        tf.keyboardType = UIKeyboardType.numberPad
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(22)
        return tf
    }()
    
    private lazy var regionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Регион"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var regionTextField: UITextField = {
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
    
    private lazy var mainPickerView: UIPickerView = {
        let mainPickerView = UIPickerView()
        mainPickerView.delegate = self
        mainPickerView.dataSource = self
        return mainPickerView
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(saveTap), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(profileSettingsLabel)
        view.addSubview(mainImage)
        view.addSubview(nameLabel)
        view.addSubview(cityLabel)
        view.addSubview(fullNameabel)
        view.addSubview(fullNameTextField)
        view.addSubview(dateOfBirthLabel)
        view.addSubview(dateOfBirthTextField)
//        createDatePicker()
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(regionLabel)
        view.addSubview(regionTextField)
        regionTextField.inputView = mainPickerView
        regionTextField.textAlignment = .left
        view.addSubview(saveButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            $0.leading.equalToSuperview().offset(20)
        }
        
        profileSettingsLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(52)
            $0.leading.equalTo(backImage.snp.trailing).offset(72)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(28)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileSettingsLabel.snp.bottom).offset(56)
            $0.leading.equalTo(mainImage.snp.trailing).offset(16)
        }
        
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(mainImage.snp.trailing).offset(16)
        }
        
        fullNameabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(32)
        }
        
        fullNameTextField.snp.makeConstraints {
            $0.top.equalTo(fullNameabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        dateOfBirthLabel.snp.makeConstraints {
            $0.top.equalTo(fullNameTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
        }
        
        dateOfBirthTextField.snp.makeConstraints {
            $0.top.equalTo(dateOfBirthLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
            
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(dateOfBirthTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        regionLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(32)
        }
        
        regionTextField.snp.makeConstraints {
            $0.top.equalTo(regionLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(regionTextField.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
//        self.dateOfBirthTextField.text = dateFormatter.string(from: datePicker.date)
//        self.view.endEditing(true)
    }
    
//    func createDatePicker() {
//        if #available(iOS 13.4, *) {
//            datePicker.preferredDatePickerStyle = .wheels
//            datePicker.datePickerMode = .date
//        } else {
//            // Fallback on earlier versions
//        }
//        dateOfBirthTextField.textAlignment = .left
//        dateOfBirthTextField.inputView = datePicker
//        dateOfBirthTextField.inputAccessoryView = createToolBar()
//    }
    
    
    func createToolBar() -> UIToolbar {
        // MARK: - ToobBar
        let toobBar = UIToolbar()
        toobBar.sizeToFit()
        
        
        // MARK: - Done toobBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toobBar.setItems([doneButton], animated: true)
        return toobBar
    }
}


// MARK: - Selector

extension ProfileSettingsViewController {
    @objc func back() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
    
    @objc func saveTap() {
        guard let firstName = fullNameTextField.text,  let lastName = fullNameTextField.text,  let email =  dateOfBirthTextField.text,  let phoneNumber = phoneNumberTextField.text,  let region_id = regionTextField.text  else { return }
        
        if !firstName.isEmpty  && !lastName.isEmpty   && !phoneNumber.isEmpty  &&  !region_id.isEmpty {
            profileSettingsViewModel.putChangeAccount(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, region_id: region_id) { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
}



// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension ProfileSettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        regionTextField.text = regions[row]
        regionTextField.resignFirstResponder()
    }
}
