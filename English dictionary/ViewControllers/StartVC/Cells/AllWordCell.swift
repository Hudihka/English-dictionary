//
//  AllWordCell.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class AllWordCell: UITableViewCell {
    
    @IBOutlet private weak var labelAll: UILabel!
    
    var valueSelected: Bool = false {
        didSet{
            self.contentView.backgroundColor = valueSelected ? .black : .white
            self.labelAll.textColor = valueSelected ? .white : .black
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
}
