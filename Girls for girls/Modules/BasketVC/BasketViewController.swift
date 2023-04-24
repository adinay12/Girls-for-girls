//
//  BasketViewController.swift
//  Girls for girls
//
//  Created by Adinay on 24/4/23.
//

import UIKit
import SnapKit

class BasketViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var basketLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Корзина"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    //   Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(BasketTableViewCell.self , forCellReuseIdentifier: BasketTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 160  // высота строки
        return tv
    }()
    
    private lazy var toPayLabel: UILabel = {
        let lb = UILabel()
        lb.text = "К оплате:"
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .light)
        return lb
    }()
    
    private lazy var commodityPricesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "7900 сом"
        lb.textColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .bold)
        return lb
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapPay), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(basketLabel)
        view.addSubview(mainTableView)
        view.addSubview(toPayLabel)
        view.addSubview(commodityPricesLabel)
        view.addSubview(payButton)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(18)
        }
        
        basketLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(46)
            $0.leading.equalTo(backImage.snp.trailing).offset(128)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(basketLabel.snp.bottom).offset(46)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().offset(-410)
        }
        
        toPayLabel.snp.makeConstraints {
            $0.top.equalTo(mainTableView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(244)
            $0.height.equalTo(22)
        }
        
        commodityPricesLabel.snp.makeConstraints {
            $0.top.equalTo(mainTableView.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().offset(-28)
            $0.height.equalTo(22)
        }
        
        payButton.snp.makeConstraints {
            $0.top.equalTo(toPayLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
    }
}



extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as! BasketTableViewCell
        return cell
    }
    
}

extension BasketViewController {
    @objc func imageTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapPay() {
        print("Оплатить")
    }
}
