//
//  ShopCollectionViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 25/3/23
//

import UIKit
import SnapKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ShopCollectionViewCell"
    
    private lazy var sweatshirtImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Rectangle 20")
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var mainView: UIView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Rectangle 3549")
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Толстовка Весна"
        lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .medium)
        return lb
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "2990 сом"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 11, weight: .bold)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(sweatshirtImage)
        contentView.addSubview(mainView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sweatshirtImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(16)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(sweatshirtImage.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(16)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(sweatshirtImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(22)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(22)
        }
    }
}
