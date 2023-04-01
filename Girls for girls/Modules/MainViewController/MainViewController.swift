//
//  MainViewController.swift
//  Girls for girls
//
//  Created by Adinay on 13/2/23.
//

import UIKit
import SnapKit
import Alamofire

class MainViewController: BaseViewController {
    
    private lazy var humanImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "human")
        
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Привет, Айканыш"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return lb
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Расти вместе с нами!"
        lb.textColor = UIColor(red: 0.429, green: 0.429, blue: 0.429, alpha: 1)
        lb.font = .systemFont(ofSize: 15, weight: .medium)
        
        return lb
    }()
    
    private lazy var pushImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "push")
        iv.isUserInteractionEnabled = true
        
        let pushTapped = UITapGestureRecognizer(target: self, action: #selector(pushTap))
        iv.addGestureRecognizer((pushTapped))
        
        return iv
    }()
    
    
    //   Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(MainTableViewCell.self , forCellReuseIdentifier: MainTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 820  // высота строки
        
        return tv
    }()
    
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(humanImage)
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(pushImage)
        view.addSubview(mainTableView)
        //        view.addSubview(peopleImage)
        //        contentView.addSubview(peopleImage)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        humanImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            $0.leading.equalToSuperview().offset(16)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            $0.leading.equalTo(humanImage.snp.trailing).offset(8)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(6)
            $0.leading.equalTo(humanImage.snp.trailing).offset(8)
        }
        
        pushImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(70)
            $0.trailing.equalToSuperview().offset(-18)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = New()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension MainViewController {
    @objc func pushTap() {
        print("push")
    }
}
