//
//  ProductDetailsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 17/4/23.
//

import UIKit
import SnapKit
import SwiftyJSON

class ProductDetailsViewController: BaseViewController {
    
    // MARK: - Запрос на карточку id и ProductDetailsViewModel
    
    let productDetailsViewModel: ProductDetailsViewModel
    init(id: Int, productDetailsViewModel: ProductDetailsViewModel ){
        self.id = id
        self.productDetailsViewModel = productDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Запрос на карточку товаров
    
    let id: Int?
    var product: GoodsData?
    var dimensions: [Sizes]?
    
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(tapImageBack))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
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
        iv.image = UIImage(named: "")
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Черное платьее"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .light)
        return lb
    }()
    
    private lazy var priceLabel: UILabel = {
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
    
    private lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(titleLabel)
        view.addSubview(mainImage)
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
        view.addSubview(selectSizeTextField)
        view.addSubview(addToBasketButton)
        view.addSubview(descriptionLabel)
        selectSizeTextField.inputView = mainPickerView
        selectSizeTextField.textAlignment = .center
        fetchData(id: self.id ?? 0)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            $0.leading.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(backImage.snp.trailing).offset(94)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(360)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(28)
            
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(30)
        }
        
        selectSizeTextField.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        addToBasketButton.snp.makeConstraints {
            $0.top.equalTo(selectSizeTextField.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(addToBasketButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(28)
        }
    }



// MARK: - FetchData
    
    func fetchData(id: Int) {
        let url = URL(string: "https://g4g.herokuapp.com/api/v1/product/\(id)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer \(DSGenerator.sharedInstance.getAccessToken()!)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else  {
                print("Произошла ошибка при доступе к данным")
                return
            }
            let json = JSON(data)
            print(json)
            if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                }
            do {
                let newGoods = try JSONDecoder().decode(GoodsData.self, from: data)
                self.product = newGoods
            }
            catch {
                print("Ошибка при декодировании Json в структуру Swift")
            }
            DispatchQueue.main.async { [weak self] in
                self?.titleLabel.text = self?.product?.title
                let urlImage = URL(string: self?.product?.imageUrl ?? "")
                self?.mainImage.downloadImage(from: urlImage!)
                self?.nameLabel.text =  self?.product?.title
                if let price = self?.product?.price {
                    self?.priceLabel.text = "\(String(describing:price))"
                }
                self?.descriptionLabel.text = self?.product?.description
                self?.dimensions = self?.product?.sizes
            }
        }
        task.resume()
    }
}


// MARK: - Selector

extension ProductDetailsViewController {
    @objc func tapImageBack() {
        navigationController?.popViewController(animated: true)
        print("")
    }
    
    @objc func addToBasket() {
        let vc = BasketViewController()
        navigationController?.pushViewController(vc, animated: true)
          
        }
//        productDetailsViewModel.postProduct(productId: 49, sizeId: 2, amount: 2) { [weak self] in
//            DispatchQueue.main.async {
//                self?.navigationController?.pushViewController(BasketViewController(), animated: true)
//            }
//        }
//        print("Добавить в корзину")
    }
//}


// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension ProductDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dimensions?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dimensions?[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectSizeTextField.text = dimensions?[row].name
        selectSizeTextField.resignFirstResponder()
    }
}
