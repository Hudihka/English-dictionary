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
    
    
    var valueSelected: Bool = false {
        didSet{
            self.contentView.backgroundColor = valueSelected ? .black : .white
            self.labelTheme.textColor = valueSelected ? .white : .black
            self.labelCount.textColor = valueSelected ? .white : .black
        }
    }
    
    var theme: Theme? {
        didSet{
            if let theme = theme {
                labelTheme.text = theme.name
                labelCount.text = "\(theme.words?.count ?? 0) слов"
            }
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    
}
