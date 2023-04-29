//
//  ConferenceProgramTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 27/4/23.
//

import UIKit
import SnapKit


class ConferenceProgramTableViewCell: BaseTableViewCell {
    static let identifier = "ConferenceProgramTableViewCell"
    
    private lazy var conferencesLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Donec malesuada tristique    \njusto quis ultrices. Morbi gravida \ndignissim lectus, et semper nulla varius a"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var dateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "12-мая 2023"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .medium)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var timeImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "time")
        return iv
    }()
    
    private lazy var dateTimeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "10:00 - 12:00"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .regular)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var panelDiscussinEconomyLabel: UILabel = {
        let lb = UILabel()
        lb.text = "ПАНЕЛЬНАЯ ДИСКУССИЯ.\nЭКОНОМИКА"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .bold)
        return lb
    }()
    
    private lazy var speakerImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "unsplash_hhcFGCGWQMY-3")
        return iv
    }()
    
    private lazy var nameSpeakerLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Алина Жаныбекова"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        return lb
    }()
    
    private lazy var informationConferenceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.\nDonec malesuada tristique  \njusto quis ultrices. Morbi  \ngravida dignissim lectus"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        return lb
    }()
    
    private lazy var speakerTwoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Avatar")
        return iv
    }()
    
    private lazy var timeConferenceImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "time")
        return iv
    }()
    
    private lazy var dateTimeConferenceLabel: UILabel = {
        let lb = UILabel()
        lb.text = "12:00 - 13:00"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    private lazy var publicLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Public talk С Айканыш  \nСадыковой"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .bold)
        return lb
    }()
    
    private lazy var nameOfTheSecondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Айканыш Садыкова"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        return lb
    }()
    
    private lazy var informationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.\nDonec malesuada tristique  \njusto quis ultrices. Morbi  \ngravida dignissim lectus"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        return lb
    }()
    
    private lazy var lunchImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Lunch")
        return iv
    }()
    
    private lazy var thirdSpeakerImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Avatar-2")
        return iv
    }()
    
    private lazy var timeConferenceThirtdImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "time")
        return iv
    }()
    
    private lazy var dateTimeConferenceThirtdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "14:00 - 16:00"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .regular)
        return lb
    }()
    
    private lazy var panelDiscussinHealthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "ПАНЕЛЬНАЯ ДИСКУССИЯ.\nЗДОРОВЬЕ"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .bold)
        return lb
    }()

    private lazy var nameOfTheThirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Жанна Айбекова"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        return lb
    }()
    
    private lazy var informationThirdLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.\nDonec malesuada tristique  \njusto quis ultrices. Morbi  \ngravida dignissim lectus"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        return lb
    }()
    
    private lazy var fourthSpeakerImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Avatar-3")
        return iv
    }()

    private lazy var timeConferenceFourthImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "time")
        return iv
    }()

    private lazy var dateTimeConferenceFourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "16:00 - 17:00"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .regular)
        return lb
    }()

    private lazy var publicWitchElenaTolstayaLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Public talk С Еленой \nТолстой"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .bold)
        return lb
    }()
    
    private lazy var nameOfTheFourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Елена Толстая"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 12, weight: .regular)
        return lb
    }()
    
    private lazy var informationFourthLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.\nDonec malesuada tristique  \njusto quis ultrices. Morbi  \ngravida dignissim lectus"
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .regular)
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        contentView.addSubview(conferencesLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(speakerImage)
        contentView.addSubview(timeImage)
        contentView.addSubview(dateTimeLabel)
        contentView.addSubview(panelDiscussinEconomyLabel)
        contentView.addSubview(nameSpeakerLabel)
        contentView.addSubview(informationConferenceLabel)
        contentView.addSubview(speakerTwoImage)
        contentView.addSubview(timeConferenceImage)
        contentView.addSubview(dateTimeConferenceLabel)
        contentView.addSubview(publicLabel)
        contentView.addSubview(nameOfTheSecondLabel)
        contentView.addSubview(informationLabel)
        contentView.addSubview(lunchImage)
        contentView.addSubview(thirdSpeakerImage)
        contentView.addSubview(timeConferenceThirtdImage)
        contentView.addSubview(dateTimeConferenceThirtdLabel)
        contentView.addSubview(panelDiscussinHealthLabel)
        contentView.addSubview(nameOfTheThirdLabel)
        contentView.addSubview(informationThirdLabel)
        contentView.addSubview(fourthSpeakerImage)
        contentView.addSubview(timeConferenceFourthImage)
        contentView.addSubview(dateTimeConferenceFourthLabel)
        contentView.addSubview(publicWitchElenaTolstayaLabel)
        contentView.addSubview(nameOfTheFourthLabel)
        contentView.addSubview(informationFourthLabel)
    }
    override func setupConstraints() {
        super.setupConstraints()
        conferencesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(conferencesLabel.snp.bottom).offset(80)
            $0.leading.equalToSuperview().offset(152)
        }
        
        speakerImage.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(68)
            $0.leading.equalToSuperview().offset(16)
        }
        
        timeImage.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(68)
            $0.leading.equalTo(speakerImage.snp.trailing).offset(50)
        }
        
        dateTimeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(68)
            $0.trailing.equalToSuperview().offset(-156)
        }
        
        panelDiscussinEconomyLabel.snp.makeConstraints {
            $0.top.equalTo(dateTimeLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-22)
        }
        
        nameSpeakerLabel.snp.makeConstraints {
            $0.top.equalTo(panelDiscussinEconomyLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().offset(-168)
        }
        
        informationConferenceLabel.snp.makeConstraints {
           $0.top.equalTo(nameSpeakerLabel.snp.bottom).offset(16)
           $0.trailing.equalToSuperview().offset(-80)
        }
        
        speakerTwoImage.snp.makeConstraints {
            $0.top.equalTo(informationConferenceLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
        }
        
        timeConferenceImage.snp.makeConstraints {
            $0.top.equalTo(informationConferenceLabel.snp.bottom).offset(40)
            $0.leading.equalTo(speakerTwoImage.snp.trailing).offset(38)
        }
        
        dateTimeConferenceLabel.snp.makeConstraints {
            $0.top.equalTo(informationConferenceLabel.snp.bottom).offset(40)
            $0.leading.equalTo(timeConferenceImage.snp.trailing).offset(8)
        }
        
        publicLabel.snp.makeConstraints {
            $0.top.equalTo(dateTimeConferenceLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-64)
        }
        
        nameOfTheSecondLabel.snp.makeConstraints {
            $0.top.equalTo(publicLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().offset(-170)
        }
        
        informationLabel.snp.makeConstraints {
            $0.top.equalTo(nameOfTheSecondLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-80)
        }
        
        lunchImage.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(40)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
        
        thirdSpeakerImage.snp.makeConstraints {
            $0.top.equalTo(lunchImage.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
        }
        
        timeConferenceThirtdImage.snp.makeConstraints {
            $0.top.equalTo(lunchImage.snp.bottom).offset(40)
            $0.leading.equalTo(thirdSpeakerImage.snp.trailing).offset(38)
        }
        
        dateTimeConferenceThirtdLabel.snp.makeConstraints {
            $0.top.equalTo(lunchImage.snp.bottom).offset(40)
            $0.leading.equalTo(timeConferenceThirtdImage.snp.trailing).offset(8)
        }
        
        panelDiscussinHealthLabel.snp.makeConstraints {
            $0.top.equalTo(dateTimeConferenceThirtdLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-22)
        }
        
        nameOfTheThirdLabel.snp.makeConstraints {
            $0.top.equalTo(panelDiscussinHealthLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-186)
        }
        
        informationThirdLabel.snp.makeConstraints {
            $0.top.equalTo(nameOfTheThirdLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-80)
        }
        
        fourthSpeakerImage.snp.makeConstraints {
            $0.top.equalTo(informationThirdLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(16)
        }

        timeConferenceFourthImage.snp.makeConstraints {
            $0.top.equalTo(informationThirdLabel.snp.bottom).offset(40)
            $0.leading.equalTo(fourthSpeakerImage.snp.trailing).offset(38)
        }

        dateTimeConferenceFourthLabel.snp.makeConstraints {
            $0.top.equalTo(informationThirdLabel.snp.bottom).offset(40)
            $0.leading.equalTo(timeConferenceThirtdImage.snp.trailing).offset(8)
        }
        
        publicWitchElenaTolstayaLabel.snp.makeConstraints {
            $0.top.equalTo(dateTimeConferenceFourthLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-86)
        }
        
        nameOfTheFourthLabel.snp.makeConstraints {
            $0.top.equalTo(publicWitchElenaTolstayaLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().offset(-198)
        }
        
        informationFourthLabel.snp.makeConstraints {
            $0.top.equalTo(nameOfTheFourthLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().offset(-80)
        }
        
    }
}
