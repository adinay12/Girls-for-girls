//
//  TrainingsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 27/3/23.
//

import UIKit
import SnapKit

class TrainingsViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(backTapp))
        iv.addGestureRecognizer((backTapped))
        
        return iv
    }()
    
    private lazy var mentoringLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Тренинги"
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.textAlignment = .left
        
        return lb
    }()
    
    private lazy var mentoringsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Слоган для тренингов"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "main image")
        iv.isUserInteractionEnabled = true
        
        let mainTapped = UITapGestureRecognizer(target: self, action: #selector(mainTapp))
        iv.addGestureRecognizer((mainTapped))
        
        return iv
    }()
    
    private lazy var ourMentorsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Спикеры тренингов"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mentoringLabel)
        view.addSubview(mentoringsLabel)
        view.addSubview(mainImage)
        view.addSubview(ourMentorsLabel)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            $0.leading.equalToSuperview().offset(18)
        }
        
        mentoringLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.trailing.equalToSuperview().offset(-180)
        }
        
        mentoringsLabel.snp.makeConstraints {
            $0.top.equalTo(mentoringLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(110)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(mentoringsLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        ourMentorsLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(130)
        }
    }
}


extension TrainingsViewController {
    @objc func backTapp() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
    
    @objc func mainTapp() {
        print("Подать заявку")
    }
}
