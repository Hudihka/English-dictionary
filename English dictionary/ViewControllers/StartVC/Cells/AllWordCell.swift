//
//  AllWordCell.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit
import SnapKit

class AllWordCell: UITableViewCell {
    
	private var labelAll: UILabel?
    
    var valueSelected: Bool = false {
        didSet{
            self.contentView.backgroundColor = valueSelected ? .black : .white
            self.labelAll?.textColor = valueSelected ? .white : .black
        }
    }
    
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		desingUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func desingUI(){
		
		labelAll = UILabel()
		labelAll?.text = "ВЫБРАТЬ ВСЕ"
		labelAll?.textColor = UIColor.black
		labelAll?.font = UIFont.systemFont(ofSize: 48, weight: .bold)
		labelAll?.textAlignment = .center
		self.contentView.addSubview(labelAll!)
		labelAll?.snp.makeConstraints({ (make) in
			make.bottom.equalTo(-10)
			make.left.equalTo(8)
			make.right.equalTo(-8)
			make.top.equalTo(10)
		})
		
		let viewSeparator = UIView()
		viewSeparator.backgroundColor = UIColor.black
		self.contentView.addSubview(viewSeparator)
		viewSeparator.snp.makeConstraints({ (make) in
			make.bottom.equalTo(0)
			make.left.equalTo(0)
			make.right.equalTo(0)
			make.height.equalTo(1)
		})
	}

    
}
