//
//  MentoringDetailsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 29/4/23.
//

import UIKit
import SnapKit

class MentoringDetailsViewController: BaseViewController {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var nameMentorLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Жылдыз Капарова"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    private lazy var nameMentorImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "unsplash_KIPqvvTOC1s-1")
        return iv
    }()
    
    private lazy var fullInfoMentorLabel: UILabel = {
        let lb = UILabel()
        lb.text = "asdassdasd"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(nameMentorLabel)
        view.addSubview(nameMentorImage)
        view.addSubview(fullInfoMentorLabel)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(18)
        }
        
        nameMentorLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(94)
            $0.leading.equalToSuperview().offset(16)
        }
        
        nameMentorImage.snp.makeConstraints {
            $0.top.equalTo(nameMentorLabel.snp.bottom).offset(12)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        
        fullInfoMentorLabel.snp.makeConstraints {
            $0.top.equalTo(nameMentorImage.snp.bottom).offset(16)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
    }
}



extension MentoringDetailsViewController {
    @objc func imageTap() {
        navigationController?.popViewController(animated: true)
        
    }
}
