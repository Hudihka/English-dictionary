//
//  SplitViewPresenter.swift
//  English dictionary
//
//  Created by Константин Ирошников on 24.06.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation


protocol SplitViewProtocol: class {
    
}


//абстрактный класс для наследования
//по нажатию на кнопки начинаем обрабатывать
//события этого протокола
//этот протокол обьект которого мы создаем в классе
protocol SplitViewPresenterProtocol: class {
    
    init(viewSplit: SplitViewProtocol,
         viewMaster: MasterSplitPresenterPrtocol,
         viewDetail: ChekTestPresenterPrtocol)
    
    func selectedWord(answer: AnswerWord)
    func tapedAnswer(answer: AnswerWord)
    
}


//это то что инжектим

class SplitViewPresenter: SplitViewPresenterProtocol {
    
    
    weak var viewSplit: SplitViewProtocol?
    var viewMaster: MasterSplitPresenterPrtocol?
    var viewDetail: ChekTestPresenterPrtocol?
    
    required init(viewSplit: SplitViewProtocol,
                  viewMaster: MasterSplitPresenterPrtocol,
                  viewDetail: ChekTestPresenterPrtocol) {
        
        self.viewSplit = viewSplit
        self.viewMaster = viewMaster
        self.viewDetail = viewDetail
    }

    
    func selectedWord(answer: AnswerWord){
        
    }
    
    func tapedAnswer(answer: AnswerWord){
        
    }
    
    
}
