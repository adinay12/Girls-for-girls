//
//  ForumsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 30/4/23.
//

import UIKit
import SnapKit
import SwiftyJSON

class ForumsViewController: BaseViewController {
    
    var speakersModel = [SpeakersModel]()
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let backTapped = UITapGestureRecognizer(target: self, action: #selector(backImageTap))
        iv.addGestureRecognizer((backTapped))
        return iv
    }()
    
    private lazy var mentoringLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Форумы"
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        lb.textAlignment = .left
        return lb
    }()
    
    private lazy var mentoringsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Слоган для форумов"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "Frame 279380-2")
        iv.isUserInteractionEnabled = true
        let mainTapped = UITapGestureRecognizer(target: self, action: #selector(mainImageTap))
        iv.addGestureRecognizer((mainTapped))
        return iv
    }()
    
    private lazy var ourMentorsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Спикеры форума"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.delegate = self
        tv.dataSource = self
        tv.register(ForumsTableViewCell.self , forCellReuseIdentifier: ForumsTableViewCell.identifier)
        tv.rowHeight = 160
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(backImage)
        view.addSubview(mentoringLabel)
        view.addSubview(mentoringsLabel)
        view.addSubview(mainImage)
        view.addSubview(ourMentorsLabel)
        view.addSubview(mainTableView)
        fetcSpeakers()
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
            $0.leading.equalToSuperview().offset(120)
        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(mentoringsLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        ourMentorsLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(130)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(ourMentorsLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.bottom.equalToSuperview().offset(-200)
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
                    self?.mainTableView.reloadData()  // обновляет таблицу
                }
            }
            task.resume()
        }
}

extension ForumsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakersModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForumsTableViewCell.identifier, for: indexPath) as! ForumsTableViewCell
        let urlImage = URL(string: speakersModel[indexPath.row].image_url ?? "")
        cell.speakerImage.downloadImage(from: urlImage!)
        cell.speakerLabel.text = speakersModel[indexPath.row].full_name
        cell.speakerTwoImage.downloadImage(from: urlImage!)
        cell.speakerTwoLabel.text = speakersModel[indexPath.row].full_name

        return cell
    }
}

    

extension ForumsViewController {
    @objc func backImageTap() {
        navigationController?.popViewController(animated: true)
        print("Назад")
    }
    
    @objc func mainImageTap() {
        print("Подать заявку")
    }
}
