//
//  SplitViewPresenter.swift
//  English dictionary
//
//  Created by Константин Ирошников on 24.06.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation


protocol SplitViewPresenterProtocol: class {
    
    init(viewMaster: MasterSplitPresenterPrtocol,
         viewDetail: ChekTestPresenterPrtocol)
    
    func selectedWord(answer: AnswerWord)
    func tapedAnswer(answer: AnswerWord)
    
}


//это то что инжектим

class SplitViewPresenter: SplitViewPresenterProtocol {
    
    var viewMaster: MasterSplitPresenterPrtocol?
    var viewDetail: ChekTestPresenterPrtocol?
    
    required init(viewMaster: MasterSplitPresenterPrtocol,
                  viewDetail: ChekTestPresenterPrtocol) {
        
        self.viewMaster = viewMaster
        self.viewDetail = viewDetail
    }

    
    func selectedWord(answer: AnswerWord){
        
    }
    
    func tapedAnswer(answer: AnswerWord){
        
    }
    
    
}
