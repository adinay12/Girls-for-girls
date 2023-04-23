//
//  MetoringViewController.swift
//  Girls for girls
//
//  Created by Adinay on 12/3/23.
//

import UIKit
import SnapKit

class MetoringViewController: BaseViewController {
    
    private lazy var mentoringLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.text = "Менторство"
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var mentoringsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Ментора"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        return lb
    }()
    
    private lazy var viewAiiLabel: UILabel = {
        let lb = UILabel()
        lb.text = "ПОСМОТРЕТЬ ВСЕ"
        lb.textColor = UIColor(red: 0.357, green: 0.627, blue: 0.749, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.isUserInteractionEnabled = true
        let mainTapped = UITapGestureRecognizer(target: self, action: #selector(mainTap))
        lb.addGestureRecognizer((mainTapped))
        return lb
    }()
    
    // MARK: Collection View
    
    private var collectionView: UICollectionView?
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.backgroundColor = .red
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(mentoringLabel)
        view.addSubview(mentoringsLabel)
        view.addSubview(viewAiiLabel)
        view.addSubview(mainStackView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/4,
                                 height: view.frame.size.height/6)

        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView?.backgroundColor = .black
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(MetoringCollectionViewCell.self, forCellWithReuseIdentifier: MetoringCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mentoringLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(34)
            $0.leading.equalToSuperview().offset(150)
        }
        
        mentoringsLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(116)
            $0.leading.equalToSuperview().offset(22)
        }
        
        viewAiiLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalTo(mentoringsLabel.snp.trailing).offset(118)
        }
        
        collectionView?.snp.makeConstraints {
            $0.top.equalTo(mentoringsLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(400)
//            $0.bottom.equalToSuperview().offset(12)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(collectionView!.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(100)
        }
    }
}


extension MetoringViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MetoringCollectionViewCell.identifier, for: indexPath) as! MetoringCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            let leftAndRightPaddings: CGFloat = 40.0
            let numberOfItemsPerRow: CGFloat = 2.0
        
            let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            2
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            2
        }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return view.frame.size.width/3
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item")
    }
}



extension MetoringViewController {
    @objc func mainTap() {
        print("Подать заявку")
    }
}
