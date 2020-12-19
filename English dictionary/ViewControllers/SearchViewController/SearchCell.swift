//
//  SearchCell.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    var blockReloadData: () -> () = {  }
    
    @IBOutlet private weak var labelWord: UILabel!
    @IBOutlet private weak var labelTarnlate: UILabel!
    
    @IBOutlet private weak var buttonFave: UIButton!
    
    @IBOutlet weak var topConstreintTranslate: NSLayoutConstraint!
    
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
        guard let word = tupl?.word else {
            return
        }
        
        word.favorit = !word.favorit
        CoreDataManager.shared.saveContext()
        
        blockReloadData()
    }
    
    private func settingsCell(){
        
        guard let tupl = tupl else {
            return
        }
        
        labelWord.text = tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
        labelTarnlate.text = !tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
        
        
        labelTarnlate.isHidden = tupl.hideTranslate
        
        let image = tupl.word.favorit ? "favorit" : "not_favorit"
        buttonFave.setImage(UIImage(named: image), for: .normal)
        
        if tupl.hideTranslate{
            topConstreintTranslate.constant = -1 * labelWord.frame.height
        } else {
            topConstreintTranslate.constant = 7
        }
        
        
    }

    
}
