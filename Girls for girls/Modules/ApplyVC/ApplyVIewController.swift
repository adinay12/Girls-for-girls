//
//  ApplyVIewController.swift
//  Girls for girls
//
//  Created by Adinay on 10/4/23.
//

import UIKit
import SnapKit

class ApplyVIewController: BaseViewController {
    
    //        let applyViewModel: ApplyViewModel
    //        init(applyViewModel: ApplyViewModel) {
    //            self.applyViewModel = applyViewModel
    //            super.init(nibName: nil, bundle: nil)
    //        }
    //
    //        required init?(coder: NSCoder) {
    //            fatalError("init(coder:) has not been implemented")
    //        }
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageBack))
        
        iv.addGestureRecognizer((imageTapped))
        
        return iv
    }()
    
    private lazy var applyLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Подать заявку"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 36, weight: .semibold)
        
        return lb
    }()
    
    // MARK: Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(ApplyTableViewCell.self,forCellReuseIdentifier: ApplyTableViewCell.identifier)  // Регистрируем Ячейку
        tv.rowHeight = 880  // высота строки
        
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(applyLabel)
        view.addSubview(mainTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(18)
        }
        
        applyLabel.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(applyLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
}


extension ApplyVIewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ApplyTableViewCell.identifier, for: indexPath) as! ApplyTableViewCell
        
        cell.clickSend = {
            //            applyViewModel.postApplications(fullName: self.fullName, dateOfBirth: self.dateOfBirth, email: self.email, address: self.address, workFormat: self.workFormat, motivation: self.motivation, aboutMe: self.aboutMe, achievements: self.achievements, myFails: self.myFails, mySkills: self.mySkills, mentorProgramId: self.mentorProgramId) { [weak self] in
            
        }
        return cell
    }
}

extension ApplyVIewController {
    @objc func imageBack() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
}














//guard let fullName = fullNameTextField.text, let dateOfBirth = dateOfBirthTextField.text, let email = emailTextField.text, let address = addressTextField.text, let workFormat = workFormatTextField.text, let motivation = motivationTextField.text, let aboutMe = aboutMeTextField.text, let achievements = achievementsTextField.text, let myFails = myFailsTextField.text, let mySkills = mySkillsTextField.text, let mentorProgramId = mentorProgramIdTextField.text else { return }


//            if !fullName.isEmpty && !dateOfBirth.isEmpty && !email.isEmpty && !address.isEmpty && !workFormat.isEmpty && !motivation.isEmpty && !aboutMe.isEmpty && !achievements.isEmpty && !myFails.isEmpty && !mySkills.isEmpty &&
//                !mentorProgramId.isEmpty {
//
//                applyViewModel.postApplications(fullName: fullName, dateOfBirth: dateOfBirth, email: email, address: address, workFormat: workFormat, motivation: motivation, aboutMe: aboutMe, achievements: achievements, myFails: myFails, mySkills: myFails, mentorProgramId: mentorProgramId) { [weak self] in
//                    DispatchQueue.main.async {
//                        appDelegate.na
//                    }
//                }
