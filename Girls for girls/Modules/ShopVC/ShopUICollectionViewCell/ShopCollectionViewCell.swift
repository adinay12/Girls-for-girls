//
//  ShopCollectionViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 25/3/23
//

import UIKit
import SnapKit

//class ShopCollectionViewCell: UICollectionViewCell {
//    static let identifier = "ShopCollectionViewCell"
//    
//    private lazy var firstImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "Rectangle 20")
//        iv.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(firsTap))
//        iv.addGestureRecognizer((imageTapped))
//        
//        return iv
//    }()
//    
//    private lazy var secondImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "Rectangle 3549")
//        iv.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(secondTap))
//        
//        iv.addGestureRecognizer((imageTapped))
//        
//        return iv
//    }()
//    
//    private lazy var firstLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "Толстовка Весна"
//        lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//        lb.font = .systemFont(ofSize: 12, weight: .medium)
//        lb.isUserInteractionEnabled = true
//        let labelTappef = UITapGestureRecognizer(target: self, action: #selector(labelTAp))
//        
//        return lb
//    }()
//    
//    private lazy var secondLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "2990 сом"
//        lb.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//        lb.font = .systemFont(ofSize: 11, weight: .bold)
//        lb.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        
//        return lb
//    }()
//    
//    private lazy var thirdImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "Rectangle 20-9")
//        iv.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(secondTapp))
//        iv.addGestureRecognizer((imageTapped))
//        
//        return iv
//    }()
//    
//    private lazy var fourthImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "Rectangle 3549")
//        iv.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//        iv.addGestureRecognizer((imageTapped))
//        
//        return iv
//    }()
//    
//    private lazy var thirdLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "Куртка Весна"
//        lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//        lb.font = .systemFont(ofSize: 12, weight: .medium)
//        lb.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(thirdTap))
//        
//        return lb
//    }()
//    
//    private lazy var fourthLabel: UILabel = {
//        let lb = UILabel()
//        lb.text = "3500 сом"
//        lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//        lb.font = .systemFont(ofSize: 12, weight: .medium)
//        lb.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(thirdTap))
//        
//        return lb
//    }()
//    
//    private lazy var fifthImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "Rectangle 20-1")
//        iv.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//        iv.addGestureRecognizer((imageTapped))
//        
//        return iv
//    }()
//    
//    private lazy var sixthImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "Rectangle 3549")
//        iv.isUserInteractionEnabled = true
//        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//        iv.addGestureRecognizer((imageTapped))
//        
//        return iv
//    }()
//    
//     private lazy var fifthLabel: UILabel = {
//            let lb = UILabel()
//            lb.text = "Толстовка Весна"
//            lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//            lb.font = .systemFont(ofSize: 12, weight: .medium)
//            lb.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(thirdTap))
//            
//            return lb
//        }()
//        
//        private lazy var sixthLabel: UILabel = {
//            let lb = UILabel()
//            lb.text = "2990 сом"
//            lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//            lb.font = .systemFont(ofSize: 12, weight: .medium)
//            lb.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(thirdTap))
//            
//            return lb
//        }()
//        
//        private lazy var seventhImage:  UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: "Rectangle 20-11")
//            iv.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//            iv.addGestureRecognizer((imageTapped))
//            
//            return iv
//        }()
//        
//        private lazy var eighthImage:  UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: "Rectangle 3549")
//            iv.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//            iv.addGestureRecognizer((imageTapped))
//            
//            return iv
//        }()
//        
//        private lazy var seventhLabel: UILabel = {
//            let lb = UILabel()
//            lb.text = "Толстовка Зима"
//            lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//            lb.font = .systemFont(ofSize: 12, weight: .medium)
//            lb.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(thirdTap))
//            
//            return lb
//        }()
//        
//        private lazy var eighthLabel: UILabel = {
//            let lb = UILabel()
//            lb.text = "2133"
//            lb.textColor = UIColor(red: 0.133, green: 0.196, blue: 0.388, alpha: 1)
//            lb.font = .systemFont(ofSize: 12, weight: .medium)
//            lb.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(thirdTap))
//            
//            return lb
//        }()
//        
//        private lazy var ninthImage: UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: "Rectangle 20")
//            iv.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//            iv.addGestureRecognizer((imageTapped))
//            
//            return iv
//        }()
//        
//        private lazy var tenthImage: UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: "Rectangle 3549")
//            iv.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//            iv.addGestureRecognizer((imageTapped))
//            
//            return iv
//        }()
//        
//        private lazy var eleventhImage: UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: "Rectangle 20-9")
//            iv.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//            iv.addGestureRecognizer((imageTapped))
//            
//            return iv
//        }()
//        
//        private lazy var twelfthImage: UIImageView = {
//            let iv = UIImageView()
//            iv.contentMode = .scaleAspectFill
//            iv.image = UIImage(named: "Rectangle 3549")
//            iv.isUserInteractionEnabled = true
//            let imageTapped = UITapGestureRecognizer(target: self, action: #selector(fourthTap))
//            iv.addGestureRecognizer((imageTapped))
//                 return iv
//        }()
//    
//    override init(frame: CGRect) {
//          super.init(frame: frame)
//          contentView.addSubview(firstImage)
//          contentView.addSubview(secondImage)
//          contentView.addSubview(firstLabel)
//          contentView.addSubview(secondLabel)
//          contentView.addSubview(thirdImage)
//          contentView.addSubview(fourthImage)
//          contentView.addSubview(thirdLabel)
//          contentView.addSubview(fourthLabel)
//          contentView.addSubview(fifthImage)
//          contentView.addSubview(sixthImage)
//          contentView.addSubview(fifthLabel)
//          contentView.addSubview(sixthLabel)
//          contentView.addSubview(seventhImage)
//          contentView.addSubview(eighthImage)
//          contentView.addSubview(seventhLabel)
//          contentView.addSubview(eighthLabel)
//          contentView.addSubview(ninthImage)
//          contentView.addSubview(tenthImage)
//          contentView.addSubview(eleventhImage)
//          contentView.addSubview(twelfthImage)
//        
//        firstImage.snp.makeConstraints {
//                    $0.top.equalToSuperview().offset(146)
//                    $0.leading.equalToSuperview().offset(16)
//                    $0.width.equalTo(242)
//                }
//                
//                secondImage.snp.makeConstraints {
//                    $0.top.equalTo(firstImage.snp.top).offset(0)
//                    $0.leading.equalToSuperview().offset(16)
//                }
//                
//                firstLabel.snp.makeConstraints {
//                    $0.top.equalTo(firstImage.snp.bottom).offset(8)
//                    $0.leading.equalToSuperview().offset(5)
//                }
//                
//                secondLabel.snp.makeConstraints {
//                    $0.top.equalTo(secondLabel.snp.bottom).offset(4)
//                    $0.leading.equalToSuperview().offset(6)
//                }
//                
//                thirdImage.snp.makeConstraints {
//                    $0.top.equalToSuperview().offset(146)
//                    $0.trailing.equalToSuperview().offset(16)
//                    $0.width.equalTo(242)
//                }
//                
//                fourthImage.snp.makeConstraints {
//                    $0.top.equalTo(thirdImage.snp.bottom).offset(0)
//                    $0.trailing.equalToSuperview().offset(16)
//                }
//                
//                thirdLabel.snp.makeConstraints {
//                    $0.top.equalTo(thirdImage.snp.bottom).offset(8)
//                    $0.trailing.equalToSuperview().offset(60)
//                }
//                
//                fourthLabel.snp.makeConstraints {
//                    $0.top.equalTo(thirdLabel.snp.bottom).offset(4)
//                    $0.trailing.equalToSuperview().offset(101)
//                }
//                
//                fifthImage.snp.makeConstraints {
//                    $0.top.equalTo(secondImage.snp.bottom).offset(4)
//                    $0.leading.equalToSuperview().offset(16)
//                }
//                
//                sixthImage.snp.makeConstraints {
//                    $0.top.equalTo(fifthImage.snp.bottom).offset(0)
//                    $0.leading.equalToSuperview().offset(20)
//                }
//                
//                fifthLabel.snp.makeConstraints {
//                    $0.top.equalTo(fifthImage.snp.bottom).offset(8)
//                    $0.leading.equalToSuperview().offset(20)
//                }
//                
//                sixthLabel.snp.makeConstraints {
//                    $0.top.equalTo(fifthLabel.snp.bottom).offset(4)
//                    $0.leading.equalToSuperview().offset(22)
//                }
//                
//                seventhImage.snp.makeConstraints {
//                    $0.top.equalTo(thirdImage.snp.bottom).offset(3)
//                    $0.trailing.equalToSuperview().offset(16)
//                }
//                
//                eighthImage.snp.makeConstraints {
//                    $0.top.equalTo(seventhImage.snp.bottom).offset(0)
//                    $0.trailing.equalToSuperview().offset(16)
//                }
//                
//                seventhLabel.snp.makeConstraints {
//                    $0.top.equalTo(seventhImage.snp.bottom).offset(8)
//                    $0.trailing.equalToSuperview().offset(60)
//                }
//                
//                eighthLabel.snp.makeConstraints {
//                    $0.top.equalTo(seventhLabel.snp.bottom).offset(4)
//                    $0.trailing.equalToSuperview().offset(118)
//                }
//                
//                ninthImage.snp.makeConstraints {
//                    $0.top.equalTo(sixthImage.snp.bottom).offset(3)
//                    $0.leading.equalToSuperview().offset(16)
//                }
//                
//                tenthImage.snp.makeConstraints {
//                    $0.top.equalTo(ninthImage.snp.bottom).offset(0)
//                    $0.leading.equalToSuperview().offset(16)
//                }
//                
//                eleventhImage.snp.makeConstraints {
//                    $0.top.equalTo(eighthImage.snp.bottom).offset(3)
//                    $0.trailing.equalToSuperview().offset(16)
//                }
//                
//                twelfthImage.snp.makeConstraints {
//                    $0.top.equalTo(eleventhImage.snp.bottom).offset(0)
//                    $0.trailing.equalToSuperview().offset(16)
//                }
//            }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//      
//      
//      override func layoutSubviews() {
//          super.layoutSubviews()
//          firstImage.frame = contentView.frame
//          secondImage.frame = contentView.frame
//          firstLabel.frame = contentView.frame
//          secondLabel.frame = contentView.frame
//          thirdImage.frame = contentView.frame
//          fourthImage.frame = contentView.frame
//          thirdLabel.frame = contentView.frame
//          fourthLabel.frame = contentView.frame
//          fifthImage.frame = contentView.frame
//          sixthImage.frame = contentView.frame
//          fifthLabel.frame = contentView.frame
//          sixthLabel.frame = contentView.frame
//          seventhImage.frame = contentView.frame
//          eighthImage.frame = contentView.frame
//          seventhLabel.frame = contentView.frame
//          eighthLabel.frame = contentView.frame
//          ninthImage.frame = contentView.frame
//          tenthImage.frame = contentView.frame
//          eleventhImage.frame = contentView.frame
//          twelfthImage.frame = contentView.frame
//      }
//      
//      override func prepareForReuse() {
//          super.prepareForReuse()
//          firstImage.image = nil
//          secondImage.image = nil
//          thirdImage.image = nil
//          fourthImage.image = nil
//          fifthImage.image = nil
//          sixthImage.image = nil
//          seventhImage.image = nil
//          eighthImage.image = nil
//          ninthImage.image = nil
//          tenthImage.image = nil
//          eleventhImage.image = nil
//          twelfthImage.image = nil
//      }
//  }
//
//
//  extension ShopCollectionViewCell {
//      @objc func firsTap() {
//          print("картина")
//      }
//      @objc func secondTap() {
//          print("картина")
//      }
//      @objc func labelTAp() {
//          print("Толстовка Весна")
//      }
//      @objc func tapped() {
//          print("2990 сом")
//      }
//      @objc func secondTapp() {
//          print("картина2")
//      }
//      @objc func fourthTap() {
//          print("картина2")
//      }
//      @objc func thirdTap() {
//          print("thirdTap")
//      }
//  }
