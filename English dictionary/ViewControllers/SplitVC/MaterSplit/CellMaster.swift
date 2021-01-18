//
//  CellMaster.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class CellMaster: UITableViewCell {
    
    @IBOutlet private weak var labelText: UILabel!
    @IBOutlet private weak var labelTranslate: UILabel!
    
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
            if let trueAnswer = trueAnswer {
                self.contentView.backgroundColor = trueAnswer ? .green : .red
                
                if trueAnswer == false {
                    self.labelText.textColor      = .white
                    
                    self.labelTranslate.isHidden  = false
                    self.labelTranslate.textColor = .white
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .white
        self.labelText.textColor         = .black
        self.labelTranslate.textColor    = .black
        self.labelTranslate.isHidden     = true
    }
    
    
    
}