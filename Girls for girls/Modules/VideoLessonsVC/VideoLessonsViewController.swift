//
//  VideoLessonsViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit
import SnapKit

class VideoLessonsViewController: BaseViewController {
    
    private lazy var mainFirstLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Видеоуроки"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return lb
    }()
    
    
    // Создаем тейбл вью
    
    private lazy var mainTableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tv.register(VideoLessonsTableViewCell.self, forCellReuseIdentifier: VideoLessonsTableViewCell.identifier)
        tv.rowHeight = 1000
        
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(mainFirstLabel)
        view.addSubview(mainTableView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainFirstLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            $0.leading.trailing.equalToSuperview().inset(126)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(mainFirstLabel.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
}


extension VideoLessonsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoLessonsTableViewCell.identifier, for: indexPath) as! VideoLessonsTableViewCell
        
        return cell
    }
}
