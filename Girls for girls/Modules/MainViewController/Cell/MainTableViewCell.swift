//
//  MainTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 4/3/23.
//

import UIKit
import SnapKit

class MainTableViewCell: BaseTableViewCell {
    static let identifier = "MainTableViewCell"
    
    // MARK: Нажатие внутри ячейки MainTableViewCell через Замыкания
    
    var clickMore: (() -> Void)? = nil
    
    var clickApply: (() -> Void)? = nil
    
    var moreTap: (() -> Void)? = nil
    
    var applyTap: (() -> Void)? = nil
    
    
    private lazy var firstImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Rectangle 3513-1")
        
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Летний тренинг для девочек"
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)

        return lb
    }()

    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Пройди летнюю программу менторства со своими\nединомышленницами"
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 12, weight: .regular)

        return lb
    }()

    private lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.149, green: 0.2, blue: 0.259, alpha: 0.05)
        button.titleLabel?.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1).cgColor
        button.frame = CGRect(x: 0, y: 0, width: 84, height: 18)
        button.setTitle("Подробнее", for: .normal)
        button.setTitleColor(UIColor.systemPurple, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)

        return button
    }()

    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.titleLabel?.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Подать заявку", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true

        button.addTarget(self, action: #selector(applyTapped), for: .touchUpInside)

        return button
    }()
    
    private lazy var secondImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Rectangle 3513-12")
        
        return iv
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Летний тренинг для девочек"
        lb.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)

        return lb
    }()

    private lazy var fourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Пройди летнюю программу менторства со своими\nединомышленницами"
        lb.textColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 12, weight: .regular)

        return lb
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.149, green: 0.2, blue: 0.259, alpha: 0.3)
        button.titleLabel?.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1).cgColor
        button.frame = CGRect(x: 0, y: 0, width: 84, height: 18)
        button.setTitle("Подробнее", for: .normal)
        button.setTitleColor(UIColor.systemPurple, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true

        button.addTarget(self, action: #selector(moreTapp), for: .touchUpInside)

        return button
    }()

    private lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.titleLabel?.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Подать заявку", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true

        button.addTarget(self, action: #selector(applyTapp), for: .touchUpInside)

        return button
    }()

    override func setupViews() {
        super.setupViews()
        contentView.addSubview(firstImage)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(mainButton)
        contentView.addSubview(firstButton)
        contentView.addSubview(secondImage)
        contentView.addSubview(thirdLabel)
        contentView.addSubview(fourthLabel)
        contentView.addSubview(secondButton)
        contentView.addSubview(thirdButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        firstImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(380)
//            $0.width.equalTo(390)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.leading.equalToSuperview().offset(12)
        }

        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(28)
        }

        mainButton.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(152)
            $0.height.equalTo(50)
        }

        firstButton.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(18)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(152)
            $0.height.equalTo(50)
        }
        
        secondImage.snp.makeConstraints {
            $0.top.equalTo(firstImage.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(380)
//            $0.width.equalTo(390)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondImage.snp.top).offset(200)
            $0.leading.equalToSuperview().offset(12)
        }

        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(28)
        }
        
        secondButton.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(46)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(152)
            $0.height.equalTo(50)
        }

        thirdButton.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(46)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(152)
            $0.height.equalTo(50)
        }
    }
}


extension MainTableViewCell {
    @objc func moreTapped() {
        clickMore?()
    }
    
    @objc func applyTapped() {
        clickApply?()
    }
    
    @objc func moreTapp() {
        moreTap?()
    }
    
    @objc func applyTapp() {
        applyTap?()
    }
}

