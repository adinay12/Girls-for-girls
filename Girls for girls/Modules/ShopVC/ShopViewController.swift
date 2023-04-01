//
//  ShopViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit
import SnapKit

class ShopViewController: BaseViewController {
    
    
    override func setupViews() {
            super.setupViews()
            view.backgroundColor = UIColor(red: 0.767, green: 0.767, blue: 0.767, alpha: 1)
    
}
}
//    
//    private lazy var firstLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "Магазин"
//        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        lb.font = .systemFont(ofSize: 16, weight: .semibold)
//        
//        return lb
//    }()
//    
//    private lazy var secondLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "Показать категории"
//        lb.textColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        lb.font = .systemFont(ofSize: 18, weight: .medium)
//        
//        return lb
//    }()
//    
//    
//    // MARK: Создаем CollectionView
//    
//    private lazy var collectionView = UICollectionView(frame: .zero,
//                     collectionViewLayout: UICollectionViewLayout())
//    
//
//        view.addSubview(firstLabel)
//        view.addSubview(secondLabel)
//        view.addSubview(collectionView)
//        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: ShopCollectionViewCell.identifier)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }
//    
//    override func setupConstrains() {
//        super.setupConstrains()
//        firstLabel.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
//            $0.leading.equalToSuperview().offset(126)
//            $0.trailing.equalToSuperview().offset(124)
//        }
//        
//        secondLabel.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(98)
//            $0.leading.equalToSuperview().offset(16)
//        }
//    }
//}


//extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 23
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifier, for: indexPath)
//        return cell
//    }
//}
