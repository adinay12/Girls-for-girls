//
//  ShopViewController.swift
//  Girls for girls
//
//  Created by Adinay on 21/2/23.
//

import UIKit
import SnapKit
import SwiftUI
import SwiftyJSON

class ShopViewController: BaseViewController {
    
    var goodsList = [GoodsData]()
    
    private lazy var shopLabel = UILabel(title: "Магазин",
                                         textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                         font: .systemFont(ofSize: 16, weight: .semibold))
    
    private lazy var categoryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Товары"
        lb.textColor = UIColor(red: 0.859, green: 0.4, blue: 0.894, alpha: 1)
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
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
        lb.text = "Корзина"
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
        view.addSubview(basketImage)
        view.addSubview(basketabel)
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/2.3,
                                 height: view.frame.size.height/4)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: ShopCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        fetchData()
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        shopLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(170)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
            $0.leading.equalToSuperview().offset(36)
        }
        
        basketImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(52)
            $0.trailing.equalToSuperview().offset(-36)
        }
        
        basketabel.snp.makeConstraints {
            $0.top.equalTo(basketImage.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        collectionView?.snp.makeConstraints {
            $0.top.equalTo(shopLabel.snp.bottom).offset(68)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(12)
        }
    }
    
    
// MARK: - FetchData
    
    func fetchData() {
        let url = URL(string: "https://g4g.herokuapp.com/api/v1/product")
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
                let newGoods = try JSONDecoder().decode([GoodsData].self, from: data)
                self.goodsList = newGoods
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


// MARK: - DownloadImage

extension UIImageView {
    func downloadImage(from url: URL) {
        contentMode = .scaleAspectFit
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data , error == nil,
                  let image = UIImage(data: data)
            else {
                print("Произошла ошибка при доступе к изображению с URL-адреса")
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        })
        dataTask.resume()
    }
}



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewLayout

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return goodsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifier, for: indexPath) as! ShopCollectionViewCell
        
        let urlImage = URL(string: goodsList[indexPath.row].imageUrl ?? "")
        cell.sweatshirtImage.downloadImage(from: urlImage!)
        cell.titleLabel.text = goodsList[indexPath.row].title
        cell.priceLabel.text = String(goodsList[indexPath.row].price!)
        return cell
    }

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//        {
//            let leftAndRightPaddings: CGFloat = 45.0
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let vc = ProductDetailsViewController(id: goodsList[indexPath.row].id ?? 0)
        navigationController?.pushViewController(vc, animated: true)
        print("item")
    }
}



// MARK: - Selector

extension ShopViewController {
    @objc func shopTap() {
        let vc = BasketViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Корзина")
    }
    
    @objc func addTap() {
        let vc = AddProductViewController(addProductViewModel: AddProductViewModel())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func basketLabelTap() {
        let vc = BasketViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Корзина")
    }
}
