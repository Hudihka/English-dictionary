//
//  ChekCell.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekCell: UITableViewCell {

    @IBOutlet private weak var labelText: UILabel!
    
    var word: Word? {
        didSet{
            if let word = word{
                labelText.text = ManagerSettings.shared.rusAnglTranslate ? word.rusValue : word.engValue
            }
        }
    }
    
    var itsError: Bool = false {
        didSet{
            self.contentView.backgroundColor = itsError ? .red : .white
            self.labelText.textColor = itsError ? .white : .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}
