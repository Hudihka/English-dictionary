//
//  CellMaster.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class CellMaster: BaseCell {
    
    private var labelText: UILabel!
    private var labelTranslate: UILabel!
    
    var wordAndTranslate: (word: Word, rusEngl: Bool)?{
        didSet{
            if let tulp = wordAndTranslate {
                labelText.text      =  tulp.rusEngl ? tulp.word.rusValue : tulp.word.engValue
                labelTranslate.text = !tulp.rusEngl ? tulp.word.rusValue : tulp.word.engValue
            }
        }
    }
    
    var trueAnswer: Bool? = nil {
        didSet{
            
            colorContent()
            
            if let trueAnswer = trueAnswer {
                self.contentView.backgroundColor = trueAnswer ? .green : .red
                self.labelTranslate.isHidden  = false
                
                if trueAnswer == false {
                    self.labelText.textColor      = .white
                    self.labelTranslate.textColor = .white
                }
            }
        }
    }
    
    private func colorContent(){
        self.contentView.backgroundColor = UIColor(rgb: 0xE9E9E9)
        self.labelText.textColor         = .black
        self.labelTranslate.textColor    = .black
        self.labelTranslate.isHidden     = true
    }
	
	override func desingUI(){
		
		labelText = UILabel()
		labelText.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
		self.contentView.addSubview(labelText)
		
		labelText.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(21)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(15)
		})
		
		
		labelTranslate = UILabel()
		labelTranslate.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		self.contentView.addSubview(labelTranslate)
		
		labelTranslate.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(15)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(labelText.snp.bottom).offset(5)
			make.bottom.equalTo(-11)
		})
		
		colorContent()
	}
    
    
    
}
