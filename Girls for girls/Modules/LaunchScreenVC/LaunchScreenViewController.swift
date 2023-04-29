//
//  LaunchScreenViewController.swift
//  Girls for girls
//
//  Created by Adinay on 3/4/23.
//

import UIKit
import SnapKit

class LaunchScreenViewController: BaseViewController {
    
    private lazy var mainImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Group 238298-3")
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.941, green: 0.941, blue: 0.957, alpha: 1)
        view.addSubview(mainImage)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [weak self] in
            let vc = WelcomePageViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        mainImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(276)
            $0.trailing.leading.equalToSuperview().inset(16)
        }
    }
}
