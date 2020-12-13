//
//  ChekWordInfoCell.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekWordInfoCell: UITableViewCell {
    
    var blockTapedFavorite: () -> () = {   }

    @IBOutlet private weak var labelStatistic: UILabel!
    @IBOutlet private weak var labelWord: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!
    
    @IBOutlet private weak var buttonFavorite: UIButton!
    
    var word: Word? {
        didSet{
            if let word = self.word{
                labelWord.text = ManagerSettings.shared.rusAnglTranslate ? word.rusValue : word.engValue
                labelDescription.text = word.descript
                let image = word.favorit ? "favorit" : "not_favorit"
                buttonFavorite.setImage(UIImage(named: image), for: .normal)
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
        if let value = self.word?.favorit{
            let newValue = !value
            word?.favorit = newValue
            blockTapedFavorite()
        }
        
    }
    
}
