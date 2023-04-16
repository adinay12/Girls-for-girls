//
//  MoreViewController.swift
//  Girls for girls
//
//  Created by Adinay on 13/4/23.
//

import UIKit
import SnapKit

class MoreViewController: BaseScrolView {
    
    private lazy var backImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "back")
        iv.isUserInteractionEnabled = true
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        iv.addGestureRecognizer((imageTapped))
        return iv
    }()
    
    private lazy var applicationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Подробнее о Заявке"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "E123EBA7-5A70-4BDC-AE9A-C7756050A070")
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var moreLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.text = "Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества. Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества.Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества. Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества.Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества. Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества.Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества. Приглашаем Вас принять участие на 2-дневном тренинге Girls for Girls, который пройдет в городе. Целью тренинга является - мотивация девочек к саморазвитию, лидерству, защите своих прав, и участию в социальных проектах, которые внесут вклад в развитие нашего общества."
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        contentView.addSubview(backImage)
        contentView.addSubview(backImage)
        contentView.addSubview(applicationLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(moreLabel)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        backImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
            $0.leading.equalToSuperview().offset(18)
        }
        
        applicationLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(106)

        }
        
        mainImage.snp.makeConstraints {
            $0.top.equalTo(applicationLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.width.equalTo(340)
//            $0.height.equalTo(350)#
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalTo(mainImage.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(16)
//            $0.height.equalTo(400)
            $0.bottom.equalToSuperview().offset(-180)
        }
    }
}



extension MoreViewController {
    @objc func imageTap() {
        navigationController?.popViewController(animated: true)
        print("назад")
    }
}
