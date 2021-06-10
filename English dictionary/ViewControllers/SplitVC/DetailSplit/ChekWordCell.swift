//
//  ChekWordCell.swift
//  English dictionary
//
//  Created by Админ on 18.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekWordCell: BaseCell {
    
    private var textCell: UILabel!
    
    var textTranslate: String? {
        didSet{
            dumpColor()
            textCell.text = textTranslate
        }
    }
    
    func colorSelected(answerTrue: Bool){
        
        if answerTrue {
            Vibro.weak()
            self.contentView.backgroundColor = .green
        } else {
            Vibro.strong()
            self.contentView.backgroundColor = .red
        }
        
        self.textCell.textColor = .white
        
    }
    
    func dumpColor(){
        self.contentView.backgroundColor = .white
        self.textCell.textColor          = .black
    }
	
	override func desingUI(){
		
		textCell = UILabel()
		textCell.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
		textCell.numberOfLines = 0
		self.contentView.addSubview(textCell)
		
		textCell.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(20)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(12)
			make.bottom.equalTo(-12)
		})
		
	}
    
}
