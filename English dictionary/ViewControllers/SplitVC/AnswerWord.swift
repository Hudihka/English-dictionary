//
//  AnswerWord.swift
//  English dictionary
//
//  Created by Константин Ирошников on 24.06.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation

struct AnswerWord {
    var word: Word!
    var words = [Word]()
    var answer: Bool?
    
    init(word: Word) {
        self.word = word
    }
    
    mutating func addWordsArray(wordsArray: [Word]) {
        if answer != nil {
            return
        }
        
        
        var words = wordsArray.filter({$0.id != word.id})[randomPick: 10]
        let randomIndex = arc4random() % 10
        words[Int(randomIndex)] = word
        
        self.words = words
    }
    
    
    
    mutating func answer(answer: Bool) {
        self.answer = answer
        self.words = []
    }
    
    func chekAnswer(word: Word) -> Bool {
        return self.word.id == word.id
    }
    
    
}
