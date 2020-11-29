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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let count = Word.findAll().count
        titleLable.text = "Всего \(count) слов"
    }
    

}
