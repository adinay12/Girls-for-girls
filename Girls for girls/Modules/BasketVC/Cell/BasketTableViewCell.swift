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
    
    let dimensions = ["L",
                      "M",
                      "S",
                      "XL"]
    
    private lazy var yourOrderLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Ваш заказ"
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .light)
        return lb
    }()
    
    private lazy var jeansImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Rectangle 20-7")
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Белый топ"
        lb.textColor =  UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 15, weight: .light)
        return lb
    }()
    
    private lazy var sizeTextField: UITextField = {
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
    
    private lazy var priceProductLabel: UILabel = {
        let lb = UILabel()
        lb.text = "4400 cом"
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    
    private lazy var quantityTextField: UITextField = {
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
    
    private lazy var deleteImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "delete")
        iv.isUserInteractionEnabled = true
        let deleteTapped = UITapGestureRecognizer(target: self, action: #selector(tapDelete))
        iv.addGestureRecognizer((deleteTapped))
        return iv
    }()
    
//    private lazy var lineImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.image = UIImage(named: "Vector 1-1")
//        return iv
//    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        contentView.addSubview(yourOrderLabel)
        contentView.addSubview(jeansImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(sizeTextField)
        sizeTextField.inputView = mainPickerView
        sizeTextField.textAlignment = .center
        contentView.addSubview(priceProductLabel)
        contentView.addSubview(quantityTextField)
        contentView.addSubview(deleteImage)
//        contentView.addSubview(lineImage)
       
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        yourOrderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(268)
        }
        
        jeansImage.snp.makeConstraints {
            $0.top.equalTo(yourOrderLabel).offset(28)
            $0.leading.equalToSuperview().offset(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalTo(jeansImage.snp.trailing).offset(22)
        }
        
        sizeTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(jeansImage.snp.trailing).offset(32)
            $0.width.equalTo(36)
            $0.height.equalTo(30)
        }
        
        priceProductLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        quantityTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(sizeTextField.snp.trailing).offset(122)
            $0.width.equalTo(36)
            $0.height.equalTo(30)
        }
        
        deleteImage.snp.makeConstraints {
            $0.top.equalTo(priceProductLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
//        lineImage.snp.makeConstraints {
//            $0.top.equalTo(deleteImage.snp.bottom).offset(48)
//            $0.trailing.leading.equalToSuperview().inset(16)
//        }
    }
}


extension BasketTableViewCell {
    @objc func tapDelete() {
        print("Удалить")
    }
}


// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension BasketTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
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
        sizeTextField.text = dimensions[row]
        sizeTextField.resignFirstResponder()
    }
}
