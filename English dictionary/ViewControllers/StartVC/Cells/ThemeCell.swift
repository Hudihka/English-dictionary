//
//  ThemeCell.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ThemeCell: UITableViewCell {
    
    var labelTheme: UILabel!
    var labelCount: UILabel!
    var countFavorite: UILabel!
    var favoritImage: UIImageView!
    
    
    var valueSelected: Bool = false {
        didSet{
            self.contentView.backgroundColor = valueSelected ? .black : .white
            self.labelTheme.textColor = valueSelected ? .white : .black
            self.labelCount.textColor = valueSelected ? .white : .black
            self.countFavorite.textColor = valueSelected ? .white : .black
        }
    }
    
    var theme: Theme? {
        didSet{
            if let theme = theme {
                labelTheme.text = theme.name
                labelCount.text = "\(theme.words?.count ?? 0) слов"
                
                countFavorite.isHidden = true
                favoritImage.isHidden = true
                
                if let name = theme.name {
                    settingsCountFavorite(theme: name)
                }
            }
        }
    }
    
    private func settingsCountFavorite(theme: String){
        
        let predicate = NSPredicate(format: "theme == %@ AND favorit == YES", theme)
        let wordsCount = Word.findAll(by: predicate, context: nil).count
        
        if wordsCount != 0 {
            countFavorite.text = "\(wordsCount)"
            countFavorite.isHidden = false
            favoritImage.isHidden = false
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
		
		labelTheme = UILabel()
		labelTheme.font = UIFont.systemFont(ofSize: 18, weight: .medium)

		self.contentView.addSubview(labelTheme)
		labelTheme.snp.makeConstraints({ (make) in
			make.height.equalTo(33)
			make.left.equalTo(16)
			make.right.equalTo(-16)
			make.top.equalTo(10)
		})
		
		
		labelCount = UILabel()
		labelCount.font = UIFont.systemFont(ofSize: 16)

		self.contentView.addSubview(labelCount)
		labelCount.snp.makeConstraints({ (make) in
			make.width.equalTo(85)
			make.top.equalTo(self.labelTheme.snp.top).offset(9)
			make.bottom.equalTo(13)
			make.left.equalTo(self.labelTheme.snp.left)
		})
		
		
		
		favoritImage = UIImageView(image: UIImage(named: "favorit"))
		self.contentView.addSubview(favoritImage)
		favoritImage.snp.makeConstraints { (make) in
			make.height.equalTo(18)
			make.width.equalTo(18)
			make.centerY.equalTo(self.labelCount.snp.centerY)
			make.left.equalTo(self.labelCount.snp.right)
		}
		
		countFavorite = UILabel()
		countFavorite.font = UIFont.systemFont(ofSize: 16)
		self.contentView.addSubview(countFavorite)
		countFavorite.snp.makeConstraints({ (make) in
			make.height.equalTo(18)
			make.width.equalTo(85)
			make.centerY.equalTo(self.labelCount.snp.centerY)
			make.left.equalTo(self.favoritImage.snp.right).offset(8)
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
