//
//  ProfileViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit
import SnapKit
import Localize_Swift

class ProfileViewController: BaseViewController {
    
    let availableLanguages = Localize.availableLanguages()
    
    // Add an observer for LCLLanguageChangeNotification on viewWillAppear. This is posted whenever a language changes and allows the viewcontroller to make the necessary UI updated. Very useful for places in your app when a language change might happen.
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
       }
    
    private lazy var firstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Мой профиль"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "human")
        return iv
    }()
    
    private lazy var secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Садыкова Айканыш"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .semibold)
        return lb
    }()
    
    private lazy var thirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Кыргызстан, Бишкек"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .semibold)
        return lb
    }()
    
    private lazy var historyImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-12")
        iv.isUserInteractionEnabled = true
        let history = UITapGestureRecognizer(target: self, action: #selector(historyTap))
        iv.addGestureRecognizer(history)
        return iv
    }()
    
    private lazy var syllabusImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-13")
        iv.isUserInteractionEnabled = true
        let syllabus = UITapGestureRecognizer(target: self, action: #selector(syllabusTap))
        iv.addGestureRecognizer(syllabus)
        return iv
    }()
    
    private lazy var settingsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-14")
        iv.isUserInteractionEnabled = true
        let profilesettings = UITapGestureRecognizer(target: self, action: #selector(profilesettingsTap))
        iv.addGestureRecognizer(profilesettings)
        return iv
    }()
    
    private lazy var forumsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-15")
        iv.isUserInteractionEnabled = true
        let forumsTapped = UITapGestureRecognizer(target: self, action: #selector(forumsTap))
        iv.addGestureRecognizer((forumsTapped))
        return iv
    }()
    
    private lazy var trainingsImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-17")
        iv.isUserInteractionEnabled = true
        let trainingsTapped = UITapGestureRecognizer(target: self, action: #selector(trainingsTap))
        iv.addGestureRecognizer((trainingsTapped))
        return iv
    }()
    
    private lazy var languagesImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-19")
        iv.isUserInteractionEnabled = true
        let languagesTapped = UITapGestureRecognizer(target: self, action: #selector(languagesTap))
        
        
       let  actionSheet = UIAlertController(title: nil, message: "Switch Language", preferredStyle: UIAlertController.Style.actionSheet)
          for language in availableLanguages {
              let displayName = Localize.displayNameForLanguage(language)
              let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                  (alert: UIAlertAction!) -> Void in
                      Localize.setCurrentLanguage(language)
              })
              actionSheet.addAction(languageAction)
          }
          let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
              (alert: UIAlertAction) -> Void in
          })
          actionSheet.addAction(cancelAction)
          self.present(actionSheet, animated: true, completion: nil)
        iv.addGestureRecognizer((languagesTapped))
        return iv
    }()
    
    private lazy var changePasswordImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Input-card-btn-0-22")
        iv.isUserInteractionEnabled = true
        let changePassword = UITapGestureRecognizer(target: self, action: #selector(tapChangePassword))
        iv.addGestureRecognizer(changePassword)
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(firstLabel)
        view.addSubview(mainImage)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(historyImage)
        view.addSubview(syllabusImage)
        view.addSubview(settingsImage)
        view.addSubview(forumsImage)
        view.addSubview(trainingsImage)
        view.addSubview(languagesImage)
        view.addSubview(changePasswordImage)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        firstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.trailing.leading.equalToSuperview().inset(146)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(78)
            $0.leading.equalToSuperview().offset(28)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(30)
            $0.leading.equalTo(mainImage.snp.trailing).offset(14)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(0)
            $0.leading.equalTo(mainImage.snp.trailing).offset(14)
        }
        
        historyImage.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
        
        syllabusImage.snp.makeConstraints {
            $0.top.equalTo(historyImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
        
        settingsImage.snp.makeConstraints {
            $0.top.equalTo(syllabusImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
        
        forumsImage.snp.makeConstraints {
            $0.top.equalTo(settingsImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
        
        trainingsImage.snp.makeConstraints {
            $0.top.equalTo(forumsImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
        
        languagesImage.snp.makeConstraints {
            $0.top.equalTo(trainingsImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
        
        changePasswordImage.snp.makeConstraints {
            $0.top.equalTo(languagesImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.trailing.equalToSuperview().offset(-16)
        }
    }
}


extension ProfileViewController {
    @objc func historyTap() {
        print("История заказов, 1")
    }
    
    @objc func syllabusTap() {
        print("Учебный план, 2")
    }
    
    @objc func profilesettingsTap() {
        let vc = ProfileSettingsViewController(profileSettingsViewModel: ProfileSettingsViewModel())
        navigationController?.pushViewController(vc, animated: true)
        print("Настройки профиля, 3")
    }
    
    @objc func forumsTap() {
        let vc = ConferencesViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Форумы, 4")
    }
    
    @objc func trainingsTap() {
//        let vc = TrainingsViewController()
//        navigationController?.pushViewController(vc, animated: true)
        print("Тренинги, 5")
    }
    
    @objc func languagesTap() {
        print("Языки, 6")
    }
    
    @objc func tapChangePassword() {
        let vc = ChangePasswordViewController(changePasswordViewModel: ChangePasswordViewModel())
        navigationController?.pushViewController(vc, animated: true)
        print("Частые вопросы, 7")
    }
    
    @objc func setText() {
        
    }
}
