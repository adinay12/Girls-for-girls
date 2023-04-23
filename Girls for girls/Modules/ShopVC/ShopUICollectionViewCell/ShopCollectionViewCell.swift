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
    
     var sweatshirtImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "")
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var mainView: UIView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Rectangle 3549")
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        return iv
    }()
    
     var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .medium)
        return lb
    }()
    
    var priceLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sweatshirtImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(16)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(sweatshirtImage.snp.bottom).offset(0)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(sweatshirtImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().offset(16)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().offset(22)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
}
