//
//  ProductDetailsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 17/4/23.
//

import UIKit
import SnapKit

class ProductDetailsViewController: BaseViewController {
    
    let dimensions = ["XS",
                   "S",
                   "M",
                   "L",
                   "XL"]
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(tapImageBack))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Черное платьее"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "Rectangle 26-1")
        return iv
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Черное платьее"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .light)
        return lb
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "3150 сом"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    
    private lazy var selectSizeTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tf.placeholder = "Выберите размер"
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(10)
        tf.textAlignment = .center
        tf.borderStyle = .line
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    private lazy var mainPickerView: UIPickerView = {
        let mainPickerView = UIPickerView()
        mainPickerView.delegate = self
        mainPickerView.dataSource = self
        return mainPickerView
    }()
    
    private lazy var addToBasketButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Добавить в корзину", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(firstLabel)
        view.addSubview(mainImage)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(selectSizeTextField)
        view.addSubview(addToBasketButton)
        selectSizeTextField.inputView = mainPickerView
        selectSizeTextField.textAlignment = .center
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            $0.leading.equalToSuperview().offset(16)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(backImage.snp.trailing).offset(94)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(360)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(28)
            
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(30)
        }
        
        selectSizeTextField.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        addToBasketButton.snp.makeConstraints {
            $0.top.equalTo(selectSizeTextField.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
    }
}


// MARK: - Selector

extension ProductDetailsViewController {
    @objc func tapImageBack() {
        navigationController?.popViewController(animated: true)
        print("")
    }
    
    @objc func addToBasket() {
        print("Добавить в корзину")
    }
}


// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension ProductDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dimensions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dimensions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectSizeTextField.text = dimensions[row]
        selectSizeTextField.resignFirstResponder()
    }
}
