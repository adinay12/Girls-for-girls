//
//  MentoringDetailsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 29/4/23.
//

import UIKit
import SnapKit
import SwiftyJSON

class MentoringDetailsViewController: BaseViewController {
    
   
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var speaker: SpeakersModel?
    let id: Int?
    
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
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    
    private lazy var nameMentorImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "")
        return iv
    }()
    
    private lazy var facebookImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "facebook")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapFacebook))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var instagramImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "instagram")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapInstagram))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var whatsappImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "whatsapp")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapWhatsapp))
        iv.addGestureRecognizer((imageTapped))
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
        view.addSubview(facebookImage)
        view.addSubview(instagramImage)
        view.addSubview(whatsappImage)
        view.addSubview(fullInfoMentorLabel)
        fetchId(id: self.id ?? 0 )
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
            $0.top.equalTo(nameMentorLabel.snp.bottom).offset(2)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.height.equalTo(300)
        }
        
        facebookImage.snp.makeConstraints {
            $0.top.equalTo(nameMentorLabel.snp.bottom).offset(304)
            $0.trailing.equalToSuperview().inset(160)
        }
        
        instagramImage.snp.makeConstraints {
            $0.top.equalTo(nameMentorLabel.snp.bottom).offset(304)
            $0.leading.equalTo(facebookImage.snp.trailing).offset(22)
        }
        
        whatsappImage.snp.makeConstraints {
            $0.top.equalTo(nameMentorLabel.snp.bottom).offset(304)
            $0.leading.equalTo(instagramImage.snp.trailing).offset(22)
        }
        
        fullInfoMentorLabel.snp.makeConstraints {
            $0.top.equalTo(nameMentorImage.snp.bottom).offset(16)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - FetchData
        
        func fetchId(id: Int) {
            let url = URL(string: "https://g4g.herokuapp.com/api/v1/speakers/\(id)")
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
                    let speaker = try JSONDecoder().decode(SpeakersModel.self, from: data)
                    self.speaker = speaker
                }
                catch {
                    print("Ошибка при декодировании Json в структуру Swift")
                }
                DispatchQueue.main.async { [weak self] in
                    self?.nameMentorLabel.text = self?.speaker?.full_name
                    let urlImage = URL(string: self?.speaker?.image_url ?? "")
                    self?.nameMentorImage.downloadImage(from: urlImage!)
//                    self?.instagramImage = self?.speaker?.instagram
//                    self?.whatsappImage.downloadImage(from: urlImage!)
//                    self?.facebookImage.downloadImage(from: urlImage!)
                    self?.fullInfoMentorLabel.text = self?.speaker?.full_info
                }
            }
            task.resume()
        }
    
}


// MARK: - Selector

extension MentoringDetailsViewController {
    @objc func imageTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapFacebook() {
        print("tapFacebook")
    }
    
    @objc func tapInstagram() {
        print("tapInstagram")
    }
    
    @objc func tapWhatsapp() {
        print("tapWhatsapp")
    }
}
