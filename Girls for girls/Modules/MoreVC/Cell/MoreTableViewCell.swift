//
//  MoreTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 22/4/23.
//

import UIKit
import SnapKit

class MoreTableViewCell: BaseTableViewCell {
    static let identifier = "MoreTableViewCell"
    
    var tapApply: (() -> Void)? = nil
    
    private lazy var summertrainingLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Летний тренинг для \nдевочек"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 24, weight: .semibold)
        return lb
    }()
    
    private lazy var moreАboutTrainingsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Приглашаем вас поучаствовать в тренинге 12-\nавгуста, в ПОИСКАХ НОВЫХ ВОЗМОЖНОСТЕЙ со \nсвоими единомышленницами"
        lb.textColor = UIColor(red: 0.518, green: 0.518, blue: 0.533, alpha: 1)
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Rectangle 3513-12")
        return iv
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Подать заявку", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()

    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        contentView.addSubview(summertrainingLabel)
        contentView.addSubview(moreАboutTrainingsLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(applyButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        summertrainingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        moreАboutTrainingsLabel.snp.makeConstraints {
            $0.top.equalTo(summertrainingLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(moreАboutTrainingsLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
}



extension MoreTableViewCell {
    @objc func tapButton() {
        tapApply?()
    }
}
