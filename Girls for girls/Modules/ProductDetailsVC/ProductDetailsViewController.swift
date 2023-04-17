//
//  ProductDetailsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 17/4/23.
//

import UIKit
import SnapKit

class ProductDetailsViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(tapImageBack))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var profileSettingsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Черное платьее"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(profileSettingsLabel)
    }
    
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            $0.leading.equalToSuperview().offset(20)
        }
        
        profileSettingsLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalTo(backImage.snp.trailing).offset(94)
        }
        
        
    }
}




// MARK: - Selector

extension ProductDetailsViewController {
    @objc func tapImageBack() {
        navigationController?.popViewController(animated: true)
        print("")
    }
}
