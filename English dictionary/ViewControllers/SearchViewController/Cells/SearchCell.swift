//
//  SearchCell.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
	var presenter: SertchPresenter?
    
    @IBOutlet private weak var labelWord: UILabel!
    @IBOutlet private weak var labelTarnlate: UILabel!
    
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
		presenter?.tapedLike(word: self.tupl?.word)
    }
    
    private func settingsCell(){
        
        guard let tupl = tupl else {
            return
        }
        
        labelWord.text = tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
        labelTarnlate.text = !tupl.russValue ? tupl.word.rusValue : tupl.word.engValue
        
        
		labelTarnlate.alpha = tupl.hideTranslate ? 0 : 1
        
        let image = tupl.word.favorit ? "favorit" : "not_favorit"
        buttonFave.setImage(UIImage(named: image), for: .normal)
        
        
        
    }

	
	func showAnimate(){
		
		UIView.animate(withDuration: 0.25, animations: {
			self.labelTarnlate.alpha = 1
		}) {[weak self] (compl) in
			self?.hideAniate()
		}
	}
	
	private func hideAniate(){
		UIView.animate(withDuration: 0.25, delay: 0.9, options: [], animations: {
			self.labelTarnlate.alpha = 0
		}) { (_) in
			///
		}
	}
    
}
