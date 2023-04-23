//
//  MoreViewController.swift
//  Girls for girls
//
//  Created by Adinay on 13/4/23.
//

import UIKit
import SnapKit

class MoreViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var trainingLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Тренинг"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    // MARK: - UITableView
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(MoreTableViewCell.self , forCellReuseIdentifier: MoreTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 820  // высота строки
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(trainingLabel)
        view.addSubview(mainTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            $0.leading.equalToSuperview().offset(18)
        }
        
        trainingLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(backImage.snp.trailing).offset(120)

        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(trainingLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
}


extension MoreViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier, for: indexPath) as! MoreTableViewCell
        cell.tapApply = {  [weak self] in
            let vc = ProductDetailsViewController(id: 22)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
    
}


extension MoreViewController {
    @objc func imageTap() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
}
