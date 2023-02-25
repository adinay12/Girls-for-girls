//
//  BaseScrolView.swift
//  Girls for girls
//
//  Created by Adinay on 23/2/23.
//

import UIKit
import SnapKit

class BaseScrolView: BaseViewController {
    
    //  MARK: Scroll View
    
    private lazy var  scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.keyboardDismissMode = .interactive
        
        return sv
    }()
    
    //       lazy var contentView: UIView = {
    //        let cv = UIView()
    //        cv.backgroundColor = .systemYellow
    //
    //        return cv
    //    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(scrollView)
        //        view.addSubview(contentView)
    }
    
    override func setupConstrains() {
        super.setupConstrains()
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        //        contentView.snp.makeConstraints {
        //            $0.top.bottom.width.equalTo(self.scrollView)
        //            $0.height.equalTo(self.scrollView).priority(.low)
        //        }
    }
}
