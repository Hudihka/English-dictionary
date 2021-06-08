//
//  FavoriteWords.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class FavoriteWords: BaseCell {
    
    private var labelFavorite: UILabel!
    private var labelCount: UILabel!
    
    var valueSelected: Bool = false {
        didSet{
            self.contentView.backgroundColor = valueSelected ? .black : .white
            self.labelFavorite.textColor = valueSelected ? .white : .black
            self.labelCount.textColor = valueSelected ? .white : .black
        }
    }
    
    var count: Int = 0{
        didSet{
            labelCount.text = "\(count)"
        }
    }

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func desingUI(){
		
		labelFavorite = UILabel()
		labelFavorite.text = "Выбранные слова"
		labelFavorite.textColor = UIColor.black
		labelFavorite.font = UIFont.systemFont(ofSize: 21, weight: .bold)

		self.contentView.addSubview(labelFavorite)
		labelFavorite.snp.makeConstraints({ (make) in
			make.height.equalTo(33)
			make.left.equalTo(16)
			make.right.equalTo(-16)
			make.top.equalTo(10)
		})
		
		let imageView = UIImageView(image: UIImage(named: "favorit"))
		self.contentView.addSubview(imageView)
		imageView.snp.makeConstraints { (make) in
			make.height.equalTo(18)
			make.width.equalTo(18)
			make.bottom.equalTo(-9)
			make.left.equalTo(self.labelFavorite.snp.left)
		}
		
		labelCount = UILabel()
		labelCount.textColor = UIColor.black
		labelCount.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		self.contentView.addSubview(labelCount)
		labelCount.snp.makeConstraints({ (make) in
			make.height.equalTo(18)
			make.width.equalTo(85)
			make.left.equalTo(imageView.snp.right).offset(8)
			make.centerY.equalTo(imageView)
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
