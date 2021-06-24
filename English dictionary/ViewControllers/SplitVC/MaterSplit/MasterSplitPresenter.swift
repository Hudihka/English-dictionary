//
//  MasterSplitPresenter.swift
//  English dictionary
//
//  Created by Константин Ирошников on 24.06.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation


protocol MasterSplitProtocol: class {
    var dataArray: [AnswerWord] {get set}
    func counnt(trueCount: Int, falseCount: Int)
}

protocol MasterSplitPresenterPrtocol: class {
    init(view: MasterSplitProtocol)
    
    func selecte(answerWord: AnswerWord) //выбрали слово
}


class MasterSplitPresenter: MasterSplitPresenterPrtocol {
    
    weak var view: MasterSplitProtocol?
    private var countTrue = 0
    private var countFalse = 0
    
    required init(view: MasterSplitProtocol) {
        self.view = view
    }
    
    func selecte(answerWord: AnswerWord) {
        //передача в сплит
    }
    
    
}
