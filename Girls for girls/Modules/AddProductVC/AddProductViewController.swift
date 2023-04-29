//
//  AddProductViewController.swift
//  Girls for girls
//
//  Created by Adinay on 14/4/23.
//

import UIKit
import SnapKit

class AddProductViewController: BaseViewController {
    
//    let addProductViewModel: AddProductViewModel
//    init(addProductViewModel: AddProductViewModel) {
//        self.addProductViewModel = addProductViewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        iv.addGestureRecognizer((imageTap))
        return iv
    }()
    
    private lazy var addProductLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Добавить Продукт"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        return lb
    }()
    
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Заголовок"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var titleTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(20)
        tf.delegate = self
        return tf
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Описание"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(20)
        tf.delegate = self
        return tf
    }()
    
    private lazy var priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Цена"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var priceTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(20)
        tf.delegate = self
        return tf
    }()
    
    private lazy var sizeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Размер Товара"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var sizeTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(20)
        tf.delegate = self
        return tf
    }()
    
    private lazy var attachFileLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Прикрепить Файл"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var attachFileTextField: UITextField = {
        let tf  = UITextField()
        tf.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        tf.placeholder = ""
        tf.font = .systemFont(ofSize: 14, weight: .light)
        tf.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        tf.setLeftPaddingPoints(20)
        tf.delegate = self
        return tf
    }()
    
    private lazy var addProductButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Добавить Продукт", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(addProductLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(priceLabel)
        view.addSubview(priceTextField)
        view.addSubview(sizeLabel)
        view.addSubview(sizeTextField)
        view.addSubview(attachFileLabel)
        view.addSubview(attachFileTextField)
        view.addSubview(addProductButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(38)
            $0.leading.equalToSuperview().offset(22)
        }
        
        addProductLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(34)
            $0.leading.equalTo(backImage.snp.trailing).offset(82)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(addProductLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(28)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(28)
        }
        
        descriptionTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(28)
        }
        
        priceTextField.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.top.equalTo(priceTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(28)
        }
        
        sizeTextField.snp.makeConstraints {
            $0.top.equalTo(sizeLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        attachFileLabel.snp.makeConstraints {
            $0.top.equalTo(sizeTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(28)
        }
        
        attachFileTextField.snp.makeConstraints {
            $0.top.equalTo(attachFileLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        addProductButton.snp.makeConstraints {
            $0.top.equalTo(attachFileTextField.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
}


extension AddProductViewController {
    @objc func imageTapped() {
        navigationController?.popViewController(animated: true)
        print("Назад")
    }
    
    @objc func addProduct() {
//        guard let title = titleTextField.text,  let description = descriptionTextField.text, let price = priceTextField.text,
//              let size = sizeTextField.text else { return }
//
//        if !title.isEmpty && !description.isEmpty && !price.isEmpty,
//           !size.isEmpty {
//            addProductViewModel.postAddProduct(title: title, description: description, price: price, size: size) {
//            }
//        }
    }
}


extension AddProductViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
