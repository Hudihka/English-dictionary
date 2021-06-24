//
//  SplitViewController.swift
//  English dictionary
//
//  Created by Админ on 18.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController{
    
	var dataArray: [Word] = []
	var rusEng = true
    
    static var activeSplitVC = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SplitViewController.activeSplitVC = true
        self.view.backgroundColor = .white
    }
    
    
    @objc func canRotate () -> Void {}
	
	func reloadMasterVC(idWord: String, answer: Bool){
		if let NVC = self.viewControllers.first as? UINavigationController,
			let MVC = NVC.viewControllers.first as? MasterSplitViewController{
			MVC.messageAnswer(idWord: idWord, answer: answer)
		}
	}
	
	func reloadDetailVC(answerWord: AnswerWord){
		if let NVC = self.viewControllers.last as? UINavigationController{
			if let DVC = NVC.viewControllers.first as? ChekTestViewController{
				DVC.answerWord = answerWord
			} else {
				let NDVC = ChekTestViewController.route(answerWord: answerWord, rusEngTranslate: rusEng)
				self.showDetailViewController(NDVC, sender: nil)
			}
		}
	}
	

}
