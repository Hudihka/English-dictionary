//
//  DI.swift
//  English dictionary
//
//  Created by Админ on 24.04.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation
import UIKit

//enum EnumStoryboard: String {
//
//    case main                   = "Main"
//
//    var storyboard: UIStoryboard{
//        return UIStoryboard(name: self.rawValue, bundle: nil)
//    }
//
//    func vc(_ identifier: String) -> UIViewController{
//        return self.storyboard.instantiateViewController(withIdentifier: identifier)
//    }
//
//    var instantiateVC: UIViewController?{
//        return self.storyboard.instantiateInitialViewController()
//    }
//
//}

class Builder{
    
    static func routeStart() -> UINavigationController {
		let VC = StartViewController()
        let NVC = UINavigationController(rootViewController: VC)
		NVC.clearBar()
        
        let presenter = StartPresenter(view: VC)
        VC.presenter = presenter
        
        return NVC
    }
    
	static func routeSertchWord(sectedThemes: [Theme],
								favorite: Bool) -> UINavigationController{
        
		let VC = SearchViewController()
        let NVC = UINavigationController(rootViewController: VC)
		NVC.modalPresentationStyle = .fullScreen
		let presenter = SertchPresenter(view: VC, selectedTheme: sectedThemes, favorit: favorite)
		VC.presenter = presenter
		
        return NVC
    }
	
		static func routeSplitVC(sectedThem: [Theme],
								 favoriteSelect: Bool,
								 rusEngTranslate: Bool) -> UISplitViewController{
			
			let SVC = SplitViewController()
			
			let dataArray = Word.words(text: nil,
									   themes: sectedThem,
									   favorite: favoriteSelect,
									   rusValue: nil,
									   sorted: false)//будет постоянно рандом
			
			SVC.rusEng = rusEngTranslate
			
			let tupl = Builder.routeMasterSplit(dataArray: dataArray,
												rusEngTranslate: rusEngTranslate)
			
			
			let NDVC = ChekTestViewController.route(answerWord: answer,
													rusEngTranslate: rusEngTranslate)
			
			SVC.viewControllers = [tupl.nav, NDVC]
			SVC.preferredDisplayMode = .allVisible
			
			return SVC
		}
	
    
    private static func routeMasterSplit(dataArray: [Word],
										 rusEngTranslate: Bool) -> UINavigationController {
        
																		
		let MVC = MasterSplitViewController()
		MVC.rusEng = rusEngTranslate
		MVC.dataArray = dataArray
		
		if let word = dataArray.first, let id = word.id {
			MVC.answers = [id : AnswerWord(word: word, wordsArray: dataArray)]
		}
																		
		let NVC = UINavigationController(rootViewController: MVC)
		NVC.modalPresentationStyle = .fullScreen
		NVC.view.backgroundColor = .white
        
        return NVC
        
    }
	
}
