//
//  FavoriteWords.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class FavoriteWords: UITableViewCell {
    
    @IBOutlet private weak var labelFavorite: UILabel!
    @IBOutlet private weak var labelCount: UILabel!
    
    var valueSelected: Bool = false {
        didSet{
            self.contentView.backgroundColor = valueSelected ? .black : .white
            self.labelFavorite.textColor = valueSelected ? .white : .black
            self.labelCount.textColor = valueSelected ? .white : .black
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelCount.text = "\(Word.allCountFavorite)"
    }


    
}
