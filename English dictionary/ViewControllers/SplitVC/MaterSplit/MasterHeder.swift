//
//  MasterHeder.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class MasterHeder: UITableViewHeaderFooterView {

    @IBOutlet weak var labelAll: UILabel!
    @IBOutlet weak var labelTrue: UILabel!
    @IBOutlet weak var labelFolse: UILabel!
    
    var countTrue: Int = 0 {
        didSet{
            labelTrue.isHidden = countTrue == 0
            labelTrue.text = "\(countTrue) +"
        }
    }
    
    var countFalse: Int = 0 {
        didSet{
            labelFolse.isHidden = countFalse == 0
            labelFolse.text = "\(countFalse) -"
        }
    }
    
    var count: Int = 0 {
        didSet{
            labelAll.text = "\(countTrue + countFalse) из \(count)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor(rgb: 0xE9E9E9)
    }

}
