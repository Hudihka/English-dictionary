//
//  ChekTestPresenter.swift
//  English dictionary
//
//  Created by Константин Ирошников on 24.06.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation


protocol ChekTestProtocol: class {
    var answerWord: AnswerWord? {get set}
}

protocol ChekTestPresenterPrtocol: class {
    init(view: ChekTestProtocol)
    
    func selecte(answer: Bool)
}


class ChekTestPresenter: ChekTestPresenterPrtocol {
    
    weak var view: ChekTestProtocol?
    
    required init(view: ChekTestProtocol) {
        self.view = view
    }
    
    func selecte(answer: Bool) {
        view?.answerWord?.answer = answer
        //кидаем ответ в сплит вк
    }
    
    
    
}
