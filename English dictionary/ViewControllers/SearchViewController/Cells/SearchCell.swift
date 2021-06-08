//
//  SearchCell.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchCell: BaseCell {
	var presenter: SertchPresenter?
    
    private var labelWord: UILabel!
    private var labelTarnlate: UILabel!
    private var buttonFave: UIButton!
    
    
    var tupl: (word: Word, russValue: Bool, hideTranslate: Bool)?{
        didSet{
            settingsCell()
        }
    }
    
    
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		selectedColor()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    
    @objc private func tapedLikeButton() {
		presenter?.tapedLike(word: self.tupl?.word)
    }
    
    private func settingsCell(){
        
        guard let tupl = tupl else {
            return
        }
        
        labelWord.text = tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
        labelTarnlate.text = !tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
        
        
		labelTarnlate.alpha = tupl.hideTranslate ? 0 : 1
        
        let image = tupl.word.favorit ? "favorit" : "not_favorit"
        buttonFave.setImage(UIImage(named: image), for: .normal)
        
        
        
    }

	
	func showAnimate(){
		
		UIView.animate(withDuration: 0.25, animations: {
			self.labelTarnlate.alpha = 1
		}) {[weak self] (compl) in
			self?.hideAniate()
		}
	}
	
	private func hideAniate(){
		UIView.animate(withDuration: 0.25, delay: 0.9, options: [], animations: {
			self.labelTarnlate.alpha = 0
		}) { (_) in
			///
		}
	}
	
	
	
	override func desingUI(){
		
		buttonFave = UIButton()
		buttonFave.addTarget(self, action: #selector(tapedLikeButton), for: .touchUpInside)
		buttonFave.backgroundColor = UIColor.clear
		self.contentView.addSubview(buttonFave)
		
		buttonFave.snp.makeConstraints({ (make) in
			make.top.equalTo(0)
			make.right.equalTo(0)
			make.height.equalTo(50)
			make.width.equalTo(50)
		})
		
		
		labelWord = UILabel()
		labelWord.textColor = UIColor.black
		labelWord.font = UIFont.systemFont(ofSize: 32, weight: .bold)
		self.contentView.addSubview(labelWord)
		labelWord.snp.makeConstraints({ (make) in
			make.top.equalTo(5)
			make.left.equalTo(20)
			make.right.equalTo(buttonFave.snp.left)
			make.height.greaterThanOrEqualTo(50)
		})
		
		labelTarnlate = UILabel()
		labelTarnlate.textColor = UIColor.black
		labelTarnlate.font = UIFont.systemFont(ofSize: 23)
		self.contentView.addSubview(labelTarnlate)
		labelTarnlate.snp.makeConstraints({ (make) in
			make.top.equalTo(labelWord.snp.bottom).offset(-7)
			make.bottom.equalTo(-10)
			make.left.equalTo(labelWord.snp.left)
			make.right.equalTo(-16)
			make.height.greaterThanOrEqualTo(27)
			make.height.equalTo(27).priority(750)
		})
		

	}
    
}
