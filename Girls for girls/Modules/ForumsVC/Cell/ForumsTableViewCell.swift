//
//  ForumsTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 30/4/23.
//

import UIKit
import SnapKit

class ForumsTableViewCell: BaseTableViewCell {
    static let identifier = "ForumsTableViewCell"
    
    var speakerImage: UIImageView = {
      let iv = UIImageView()
      iv.contentMode = .scaleAspectFit
      iv.image = UIImage(named:"")
      return iv
  }()
    
     var speakerLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    var speakerTwoImage: UIImageView = {
      let iv = UIImageView()
      iv.contentMode = .scaleAspectFit
      iv.image = UIImage(named: "")
      return iv
  }()
    
    var speakerTwoLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(speakerImage)
        contentView.addSubview(speakerLabel)
        contentView.addSubview(speakerTwoImage)
        contentView.addSubview(speakerTwoLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        speakerImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(100)
            
        }
        
        speakerTwoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalTo(speakerImage.snp.trailing).offset(120)
            $0.width.equalTo(100)
        }
        
        speakerLabel.snp.makeConstraints {
            $0.top.equalTo(speakerImage.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(28)
        }

        speakerTwoLabel.snp.makeConstraints {
            $0.top.equalTo(speakerTwoImage.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-56)
        }
    }
}
