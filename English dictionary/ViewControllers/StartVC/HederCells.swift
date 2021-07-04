//
//  HederCells.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class HederCells: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var labelChecVC: UILabel!
    @IBOutlet weak var separator: UIView!
    
    
    var text: String? {
        didSet{
            titleLable.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        labelChecVC.isHidden = true
    }
    

}