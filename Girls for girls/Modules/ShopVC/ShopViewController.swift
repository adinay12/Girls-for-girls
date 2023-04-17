//
//  ShopViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit
import SnapKit
import SwiftUI

class ShopViewController: BaseViewController {
    
    private lazy var shopLabel = UILabel(title: "Магазин",
                                         textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                         font: .systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var categoryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Показать категории"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        return lb
    }()
    
    private lazy var addProductLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Добавить Продукт"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 14, weight: .medium)
        lb.isUserInteractionEnabled = true
        let addTapped = UITapGestureRecognizer(target: self, action: #selector(addTap))
        lb.addGestureRecognizer((addTapped))
        return lb
    }()
    
    private lazy var basketImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "Vector-39")
        iv.isUserInteractionEnabled = true
        let mainTapped = UITapGestureRecognizer(target: self, action: #selector(shopTap))
        iv.addGestureRecognizer((mainTapped))
        return iv
    }()
    
    private lazy var basketabel: UILabel = {
        let lb = UILabel()
        lb.text = "Магазин"
        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lb.font = .systemFont(ofSize: 10, weight: .medium)
        lb.isUserInteractionEnabled = true
        let mainTapped = UITapGestureRecognizer(target: self, action: #selector(basketLabelTap))
        lb.addGestureRecognizer((mainTapped))
        return lb
    }()
    
    // MARK: Collection View
    
    private var collectionView: UICollectionView?
    
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
        view.addSubview(shopLabel)
        view.addSubview(categoryLabel)
        view.addSubview(addProductLabel)
        view.addSubview(basketImage)
        view.addSubview(basketabel)
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/2.3,
                                 height: view.frame.size.height/3)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
//        collectionView?.backgroundColor = .black
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: ShopCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
//        collectionView.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        shopLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(170)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
            $0.leading.equalToSuperview().offset(16)
        }
        
        addProductLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(16)
        }
        
        basketImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.trailing.equalToSuperview().offset(-36)
        }
        
        basketabel.snp.makeConstraints {
            $0.top.equalTo(basketImage.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        collectionView?.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
}
    

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifier, for: indexPath) as! ShopCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            let leftAndRightPaddings: CGFloat = 45.0
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailsViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("item")
    }
}



extension ShopViewController {
    @objc func shopTap() {
        print("Корзина")
    }
    
    @objc func addTap() {
        let vc = AddProductViewController(addProductViewModel: AddProductViewModel())
        navigationController?.pushViewController(vc, animated: true)
//        print("sadf")
    }
    
    @objc func basketLabelTap() {
        print("Корзина")
    }
}
