//
//  BaseTableViewCell.swift
//  Girls for girls
//
//  Created by Adinay on 4/3/23.
//

import UIKit
import SnapKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setupConstraints() {
        
    }
     
}
