//
//  SearchDescriptionCell.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchDescriptionCell: UITableViewCell {
    
    var blockReloadData: () -> () = {  }
    
    @IBOutlet private weak var labelWord: UILabel!
    @IBOutlet private weak var labelTarnlate: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!
    
    @IBOutlet private weak var buttonFave: UIButton!
    
    var tupl: (word: Word, russValue: Bool, hideTranslate: Bool)?{
        didSet{
            settingsCell()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedColor()
    }

    
    @IBAction private func actionReloadData(_ sender: Any) {
        blockReloadData()
    }
    
    private func settingsCell(){
        
        
        
    }
    
}
