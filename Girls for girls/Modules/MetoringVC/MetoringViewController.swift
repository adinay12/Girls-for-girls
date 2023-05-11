//
//  MetoringViewController.swift
//  Girls for girls
//
//  Created by Adinay on 12/3/23.
//

import UIKit
import SnapKit
import SwiftyJSON

class MetoringViewController: BaseViewController {
    
    var speakersModel = [SpeakersModel]()
    
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
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "unsplash_hhcFGCGWQMY")
        return iv
    }()
    
    private lazy var yourHealthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Твое здоровье"
        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 15, weight: .semibold)
        return lb
    }()
    
    private lazy var trainingLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Тренинг"
        lb.textColor =  UIColor(red: 0.357, green: 0.627, blue: 0.749, alpha: 1)
        lb.font = .systemFont(ofSize: 13, weight: .light)
        return lb
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        button.setTitle("Подать заявку", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(applyTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.backgroundColor = UIColor(red: 0.98, green: 0.827, blue: 0.906, alpha: 1)
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var trainingDateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "30.04.2023"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 11, weight: .medium)
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(mentoringLabel)
        view.addSubview(mentoringsLabel)
        view.addSubview(viewAiiLabel)
        view.addSubview(mainImage)
        view.addSubview(yourHealthLabel)
        view.addSubview(trainingLabel)
        view.addSubview(applyButton)
        view.addSubview(mainStackView)
        view.addSubview(trainingDateLabel)
        fetcSpeakers()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/3.2,
                                 height: view.frame.size.height/6)
//        /2.3,
//                                 height: view.frame.size.height/4)
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
            $0.top.equalToSuperview().offset(122)
            $0.leading.equalTo(mentoringsLabel.snp.trailing).offset(118)
        }
        
        collectionView?.snp.makeConstraints {
            $0.top.equalTo(viewAiiLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo()
            $0.bottom.equalToSuperview().offset(290)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(collectionView!.snp.bottom).offset(34)
            $0.leading.equalToSuperview().offset(30)
        }
        
        yourHealthLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView!.snp.bottom).offset(48)
            $0.leading.equalTo(mainImage.snp.leading).offset(60)
        }
        
        trainingLabel.snp.makeConstraints {
            $0.top.equalTo(yourHealthLabel.snp.bottom).offset(4)
            $0.leading.equalTo(mainImage.snp.leading).offset(60)
        }
        
        applyButton.snp.makeConstraints {
            $0.top.equalTo(trainingLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(50)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(collectionView!.snp.bottom).offset(48)
            $0.leading.equalTo(trainingLabel.snp.trailing).offset(136)
            $0.height.equalTo(30)
            $0.width.equalTo(100)
        }
        
        trainingDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(mainStackView.snp.centerY)
            $0.trailing.equalTo(mainStackView.snp.trailing).inset(16)
            $0.height.equalTo(16)
        }
    }
    
    // MARK: - FetchData
        
        func fetcSpeakers() {
            let url = URL(string: "https://g4g.herokuapp.com/api/v1/speakers")
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue("Bearer \(DSGenerator.sharedInstance.getAccessToken()!)", forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else  {
                    print("Произошла ошибка при доступе к данным")
                    return
                }
                let json = JSON(data)
                print(json)
                if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)
                    }
                do {
                    let speakersModel  = try JSONDecoder().decode([SpeakersModel].self, from: data)
                    self.speakersModel = speakersModel
                }
                catch {
                    print("Ошибка при декодировании Json в структуру Swift")
                }
                DispatchQueue.main.async { [weak self] in
                    self?.collectionView?.reloadData()  // обновляет таблицу
                }
            }
            task.resume()
        }
    }



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource


extension MetoringViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return speakersModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MetoringCollectionViewCell.identifier, for: indexPath) as! MetoringCollectionViewCell
        
        let urlImage = URL(string: speakersModel[indexPath.row].image_url ?? "")
        cell.mainImage.downloadImage(from: urlImage!)
        cell.mainLabel.text = speakersModel[indexPath.row].full_name
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//        {
//            let leftAndRightPaddings: CGFloat = 40.0
//            let numberOfItemsPerRow: CGFloat = 2.0
//        
//            let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
//            return CGSize(width: width, height: width)
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//            2
//        }
//        
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            2
//        }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return view.frame.size.width/3
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MentoringDetailsViewController(id: speakersModel[indexPath.row].id ?? 0)
        navigationController?.pushViewController(vc, animated: true)
        print("item")
    }
}



// MARK: - Selector

extension MetoringViewController {
    @objc func mainTap() {
        print("Подать заявку")
    }
    
    @objc func applyTapped() {
        print("sad")
    }
}
