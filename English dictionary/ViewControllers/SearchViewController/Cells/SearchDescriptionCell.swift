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
        
        labelDescription.text = tupl.word.descript
        
		labelTarnlate.alpha = tupl.hideTranslate ? 0 : 1
        labelDescription.alpha = tupl.hideTranslate ? 0 : 1
        
        let image = tupl.word.favorit ? "favorit" : "not_favorit"
        buttonFave.setImage(UIImage(named: image), for: .normal)
        
        
    }
	
	func showAnimate(){
		
		UIView.animate(withDuration: 0.25, animations: {
			self.labelTarnlate.alpha = 1
			self.labelDescription.alpha = 1
		}) {[weak self] (compl) in
			self?.hideAniate()
		}
	}
	
	private func hideAniate(){
		UIView.animate(withDuration: 0.25, delay: 0.9, options: [], animations: {
			self.labelTarnlate.alpha = 0
			self.labelDescription.alpha = 0
		}) { (_) in
			///
		}
	}
    
}
