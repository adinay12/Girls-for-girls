//
//  VideoLessonsTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 31/3/23.
//

import UIKit
import SnapKit

class VideoLessonsTableViewCell: BaseTableViewCell {
    
    static let identifier = "VideoLessonsTableViewCell"
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Лекторы"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Смотреть все"
        lb.textColor =  UIColor(red: 0.749, green: 0.278, blue: 0.784, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lb.isUserInteractionEnabled = true
        let secondTapped = UITapGestureRecognizer(target: self, action: #selector(secondTap))
        lb.addGestureRecognizer(secondTapped)
        return lb
    }()
    
    private lazy var firstImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "unsplash_KIPqvvTOC1s")
        return iv
    }()
    
    private lazy var firstlecturerName: UILabel = {
        let lb = UILabel()
        lb.text = "Алина \nАлиева"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var secondImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "unsplash_KIPqvvTOC1s")
        return iv
    }()
    
    private lazy var secondlecturerName: UILabel = {
        let lb = UILabel()
        lb.text = "Алина \nАлиева"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var thirdImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "unsplash_KIPqvvTOC1s")
        return iv
    }()
    
    private lazy var thirdlecturerName: UILabel = {
        let lb = UILabel()
        lb.text = "Алина \nАлиева"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var fourthImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "unsplash_KIPqvvTOC1s")
        return iv
    }()
    
    private lazy var fourthlecturerName: UILabel = {
        let lb = UILabel()
        lb.text = "Алина \nАлиева"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Видеоуроки"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var mainSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.replaceSegments(segments: ["Все","Категория 1","Категория 2","Категория 3"])
        sc.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.922, alpha: 1)
        
//        sc.insertSegment(withTitle: "Все", at: 0, animated: true)
//        sc.selectedSegmentIndex = 0  // Индекс
        sc.isUserInteractionEnabled = true
        sc.addTarget(self, action: #selector(segmentedTapped), for: .valueChanged)  // нажатие
        
        return sc
        
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(firstImage)
        contentView.addSubview(firstlecturerName)
        contentView.addSubview(secondImage)
        contentView.addSubview(secondlecturerName)
        contentView.addSubview(thirdImage)
        contentView.addSubview(thirdlecturerName)
        contentView.addSubview(fourthImage)
        contentView.addSubview(fourthlecturerName)
        contentView.addSubview(thirdLabel)
        contentView.addSubview(mainSegmentedControl)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(16)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        firstImage.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(0)
        }
        
        firstlecturerName.snp.makeConstraints {
            $0.top.equalTo(firstImage.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(8)
        }
        
        secondImage.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(16)
            $0.leading.equalTo(firstImage.snp.trailing).offset(16)
        }
        
        secondlecturerName.snp.makeConstraints {
            $0.top.equalTo(secondImage.snp.bottom).offset(6)
            $0.leading.equalTo(firstlecturerName.snp.trailing).offset(52)
        }
        
        thirdImage.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(16)
            $0.leading.equalTo(secondImage.snp.trailing).offset(16)
        }
        
        thirdlecturerName.snp.makeConstraints {
            $0.top.equalTo(thirdImage.snp.bottom).offset(6)
            $0.leading.equalTo(secondlecturerName.snp.trailing).offset(52)
        }
        
        fourthImage.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(16)
            $0.leading.equalTo(thirdImage.snp.trailing).offset(16)
        }
        
        fourthlecturerName.snp.makeConstraints {
            $0.top.equalTo(fourthImage.snp.bottom).offset(6)
            $0.leading.equalTo(thirdlecturerName.snp.trailing).offset(52)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(firstlecturerName.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(0)
        }
        
        mainSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(0)
//            $0.trailing.equalToSuperview().offset(4)
        }
    }
}



extension VideoLessonsTableViewCell {
    @objc func secondTap() {
        print("Смотреть все")
    }
    
    @objc func segmentedTapped() {
        
    }
}
