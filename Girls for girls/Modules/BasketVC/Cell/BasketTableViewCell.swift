//
//  BasketTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 24/4/23.
//

import UIKit
import SnapKit

class BasketTableViewCell: BaseTableViewCell {
    static let identifier = "BasketTableViewCell"
    
    var counter = 0
    var dimension: [Size]?
    
    
    private lazy var yourOrderLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Ваш заказ"
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .light)
        return lb
    }()
    
      var сlothImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "")
        return iv
    }()
    
      var productNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.textColor =  UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 15, weight: .light)
        return lb
    }()
    
      var sizeTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.setLeftPaddingPoints(6)
        tf.textAlignment = .center
        tf.borderStyle = .line
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.layer.borderWidth = 1
        return tf
    }()
    
    private lazy var mainPickerView: UIPickerView = {
        let mainPickerView = UIPickerView()
        mainPickerView.delegate = self
        mainPickerView.dataSource = self
        return mainPickerView
    }()
    
     lazy var priceProductLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    
     lazy var quantityTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.setLeftPaddingPoints(6)
        tf.textAlignment = .center
        tf.borderStyle = .line
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.layer.borderWidth = 1
        return tf
    }()
    
    private lazy var minusImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "minus")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapMinus))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var plusImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "plus")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapPlus))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()

    private lazy var deleteImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "delete")
        iv.isUserInteractionEnabled = true
        let deleteTapped = UITapGestureRecognizer(target: self, action: #selector(tapDelete))
        iv.addGestureRecognizer((deleteTapped))
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        contentView.addSubview(yourOrderLabel)
        contentView.addSubview(сlothImage)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(sizeTextField)
        sizeTextField.inputView = mainPickerView
        sizeTextField.textAlignment = .center
        contentView.addSubview(priceProductLabel)
        contentView.addSubview(quantityTextField)
        contentView.addSubview(minusImage)
        contentView.addSubview(plusImage)
        contentView.addSubview(deleteImage)
        updateTextField()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        yourOrderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(268)
        }
        
        сlothImage.snp.makeConstraints {
            $0.top.equalTo(yourOrderLabel).offset(28)
            $0.leading.equalToSuperview().offset(24)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalTo(сlothImage.snp.trailing).offset(22)
        }
        
        sizeTextField.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(сlothImage.snp.trailing).offset(32)
            $0.width.equalTo(60)
            $0.height.equalTo(50)
        }
        
        priceProductLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        quantityTextField.snp.makeConstraints {
            $0.top.equalTo(productNameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(sizeTextField.snp.trailing).offset(80)
            $0.width.equalTo(60)
            $0.height.equalTo(50)
        }
        
        minusImage.snp.makeConstraints {
            $0.centerY.equalTo(quantityTextField.snp.centerY)
            $0.trailing.equalTo(quantityTextField.snp.leading).offset(16)
            $0.height.equalTo(6)
        }
        
        plusImage.snp.makeConstraints {
            $0.centerY.equalTo(quantityTextField.snp.centerY)
            $0.leading.equalTo(quantityTextField.snp.trailing).inset(18)
            $0.height.equalTo(6)
        }
        
        deleteImage.snp.makeConstraints {
            $0.top.equalTo(priceProductLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-24)
        }
    }
    
    func updateTextField() {
        quantityTextField.text = "\(counter)"
    }
}


// MARK: - Selector

extension BasketTableViewCell {
    @objc func tapDelete() {
        print("Удалить")
    }
    
    @objc func tapMinus() {
        counter -= 1
        updateTextField()
        print("минус")
    }
    
    @objc func tapPlus() {
        counter += 1
        updateTextField()
        print("плюс")
    }
}


// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension BasketTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dimension?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dimension?[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeTextField.text = dimension?[row].name
        sizeTextField.resignFirstResponder()
    }
}
