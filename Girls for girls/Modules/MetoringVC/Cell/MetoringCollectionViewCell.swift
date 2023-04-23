//
//  MetoringCollectionViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 3/4/23.
//

import UIKit
import SnapKit

class MetoringCollectionViewCell: UICollectionViewCell {
    static let identifier = "MetoringCollectionViewCell"
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "unsplash_KIPqvvTOC1s-3")
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Катя Капарова"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 10, weight: .regular)
        return lb
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(mainImage)
        contentView.addSubview(mainLabel)
//        contentView.addSubview(mainStackView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(0)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(0)
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
