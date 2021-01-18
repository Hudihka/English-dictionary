//
//  ChekWordCell.swift
//  English dictionary
//
//  Created by Админ on 18.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekWordCell: UITableViewCell {
    
    @IBOutlet private weak var textCell: UILabel!
    
    var textTranslate: String? {
        didSet{
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
    
}
