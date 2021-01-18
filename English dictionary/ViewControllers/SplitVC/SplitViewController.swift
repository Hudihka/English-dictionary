//
//  SplitViewController.swift
//  English dictionary
//
//  Created by Админ on 18.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {
    
    fileprivate var dataArray: [Word] = []
    fileprivate var rusEng = true
    
    
    init() {
        if #available(iOS 14.0, *) {
            super.init(style: .unspecified)
        } else {
            super.init()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func route(sectedThem: [Theme],
                      favoriteSelect: Bool,
                      rusEngTranslate: Bool) -> SplitViewController{
        
        let SVC = SplitViewController()
        let dataArray = Word.words(text: nil,
                                   themes: sectedThem,
                                   favorite: favoriteSelect,
                                   rusValue: nil)//будет постоянно рандом
        
        let MVC = MasterSplitViewController.route(dataArray: dataArray, rusEngTranslate: rusEngTranslate)
        let DVC = 
        
        
        
        
    }
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        self.viewControllers =
//
//    }
    

}
