//
//  ConferenceProgramViewController.swift
//  Girls for girls
//
//  Created by Adinay on 27/4/23.
//

import UIKit
import SnapKit

class ConferenceProgramViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(tapBack))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var conferencesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Роль девушек в новом мире"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var conferenceProgramLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Программа \nконференции"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 32, weight: .bold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(ConferenceProgramTableViewCell.self , forCellReuseIdentifier: ConferenceProgramTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 1600  // высота строки
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(conferencesLabel)
        view.addSubview(conferenceProgramLabel)
        view.addSubview(mainTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(42)
            $0.leading.equalToSuperview().offset(20)
        }
        
        conferencesLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(36)
            $0.leading.equalTo(backImage.snp.trailing).offset(38)
        }
        
        conferenceProgramLabel.snp.makeConstraints {
            $0.top.equalTo(conferencesLabel.snp.top).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(conferenceProgramLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
}


// MARK: - Selector

extension ConferenceProgramViewController {
    @objc func tapBack() {
        navigationController?.popViewController(animated: true)
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension ConferenceProgramViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConferenceProgramTableViewCell.identifier, for: indexPath) as! ConferenceProgramTableViewCell
        return cell
    }
}
