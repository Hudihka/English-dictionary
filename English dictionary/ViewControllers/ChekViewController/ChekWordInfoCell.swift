//
//  ChekWordInfoCell.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekWordInfoCell: UITableViewCell {

    @IBOutlet private weak var labelStatistic: UILabel!
    @IBOutlet private weak var labelWord: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!
    
    @IBOutlet private weak var buttonFavorite: UIButton!
    
    var word: Word? {
        didSet{
            if let word = self.word{
                labelWord.text = ManagerSettings.shared.rusAnglTranslate ? word.rusValue : word.engValue
                labelDescription.text = word.descript
                
            }
        }
    }
    
    var textStatistic: String?{
        didSet{
            labelStatistic.text = textStatistic
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedColor()
        
    }

    @IBAction private func actionFavorite(_ sender: Any) {
    }
    
}
