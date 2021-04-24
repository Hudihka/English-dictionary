//
//  SplitViewController.swift
//  English dictionary
//
//  Created by Админ on 18.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController{
    
    fileprivate var dataArray: [Word] = []
    fileprivate var rusEng = true
    
    static var activeSplitVC = false
    
    static func route(sectedThem: [Theme],
                      favoriteSelect: Bool,
                      rusEngTranslate: Bool) -> SplitViewController{
        
        let SVC = EnumStoryboard.main.vc("SplitViewController") as! SplitViewController
        
        let dataArray = Word.words(text: nil,
                                   themes: sectedThem,
                                   favorite: favoriteSelect,
								   rusValue: nil,
								   sorted: false)//будет постоянно рандом
		
//		https://developer.apple.com/documentation/uikit/uisplitviewcontrollerdelegate/1623176-splitviewcontroller
        
		SVC.rusEng = rusEngTranslate
        
        let tupl = MasterSplitViewController.route(dataArray: dataArray, rusEngTranslate: rusEngTranslate)
        
		let answer = tupl.master.answers.first?.value
		
        let NDVC = ChekTestViewController.route(answerWord: answer, rusEngTranslate: rusEngTranslate)
        
		SVC.viewControllers = [tupl.nav, NDVC]
        SVC.preferredDisplayMode = .allVisible
        
        return SVC
    }
    
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
