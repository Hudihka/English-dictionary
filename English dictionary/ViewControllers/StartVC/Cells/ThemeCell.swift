//
//  ThemeCell.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ThemeCell: UITableViewCell {
    
    @IBOutlet private weak var labelTheme: UILabel!
    @IBOutlet private weak var labelCount: UILabel!
    @IBOutlet private weak var countFavorite: UILabel!
    @IBOutlet private weak var favoritImage: UIImageView!
    
    
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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    
}
