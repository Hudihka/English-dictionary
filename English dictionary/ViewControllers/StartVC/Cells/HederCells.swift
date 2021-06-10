//
//  HederCells.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class HederCells: UITableViewHeaderFooterView {

    private var titleLable: UILabel!
    
    var text: String? {
        didSet{
            titleLable.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		desingUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func desingUI(){
		
		titleLable = UILabel()
		titleLable.font = UIFont.systemFont(ofSize: 15)
		titleLable.textColor = UIColor.black
		titleLable.textAlignment = .right
		titleLable.numberOfLines = 0

		self.contentView.addSubview(titleLable)
		titleLable.snp.makeConstraints({ (make) in
			make.height.equalTo(20)
			make.width.greaterThanOrEqualTo(42)
			
			make.right.equalTo(-20)
			make.top.equalTo(10)
			make.bottom.equalTo(-10)
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
