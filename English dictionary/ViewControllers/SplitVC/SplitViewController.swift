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
        
        let word = dataArray[0]
        var words = dataArray.filter({$0.id != word.id})[randomPick: 10]
        let randomIndex = arc4random() % 10
        words[Int(randomIndex)] = word
        
        let tuplMaster = MasterSplitViewController.route(dataArray: dataArray, rusEngTranslate: rusEngTranslate)
        let masterVC = tuplMaster.master
        
        let DVC = ChekTestViewController.route(word: word, dataArray: words, isAnswer: false, rusEngTranslate: rusEngTranslate)
        let detailNVC = UINavigationController(rootViewController: DVC)
        
        //тап по ячейке нового выбранного слова
        masterVC.blockTapedCell = { word, words, answer in
            DVC.dataArray = words
            DVC.isAnswer  = answer
            DVC.word      = word
            
            //показать детальный вк
            SVC.showDetailViewController(detailNVC, sender: nil)
        }
        
        //когда выбрали слово на детальной инф
        DVC.ansverBlock = {word, answer in
            masterVC.getAnswer(word: word, answer: answer)
        }
        
        SVC.viewControllers = [tuplMaster.navig, detailNVC]
        SVC.preferredDisplayMode = .allVisible
        
        return SVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SplitViewController.activeSplitVC = true
        self.view.backgroundColor = .white
    }
    
    
    @objc func canRotate () -> Void {}

}
