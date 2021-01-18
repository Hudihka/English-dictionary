//
//  ManagerSettings.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation


class ManagerSettings {
    
    static let shared = ManagerSettings()
    
   var selectedTheme = [Theme]()
    
    var rusAnglTranslate = true
    private var visibleStatistic = true
    private var oneThemeQestion = false
    private var favoriteSelect = false
    
    private var countWord = 0
    private var countError = 0
    
    func createTheme(selectedTheme: [Theme], sertchFavorite: Bool){
        
        self.rusAnglTranslate = true
        self.visibleStatistic = true
        self.oneThemeQestion = false
        self.favoriteSelect = sertchFavorite
        
        if Word.allCountFavorite < 5 {
            self.favoriteSelect = false
        }
        
        self.countWord = 0
        self.countError = 0
        
        self.selectedTheme = []
        self.selectedTheme = selectedTheme
    }
    
    func newSettings(rusAnglTranslate: Bool,
                     visibleStatistic: Bool,
                     oneThemeQestion: Bool){
        
        self.rusAnglTranslate = rusAnglTranslate
        self.visibleStatistic = visibleStatistic
        self.oneThemeQestion = oneThemeQestion
        
    }
    
    func textStatistic(newWord: Bool, itsError: Bool) -> String?{
        
        if visibleStatistic == false {
            return nil
        }
        
        if newWord{
            countWord += 1
        }
        
        if itsError{
            countError += 1
        }
        
        return "Слов: \(countWord)\nОшибок: \(countError)"
    }
    
    var createRandom: (word: Word?, arrayWord: [Word]){
        
        let theme: [Theme] = oneThemeQestion ? selectedTheme[randomPick: 1] : selectedTheme //список тем в которых будем искать
        
        let selectedWordPredicate = Word.predicate(theme: theme, favorite: favoriteSelect)
		let selectedWord = Word.findAll(by: selectedWordPredicate, context: nil)[randomPick: 1].first //рандомно выбранное слово
		
        let random3WordPredicate = Word.predicate(theme: theme, favorite: favoriteSelect, dontValue: selectedWord)
		var random3Word = Word.findAll(by: random3WordPredicate, context: nil)[randomPick: 3] //рандомно выбранные 3 слова
		
		if let selectedWord = selectedWord, random3Word.count == 3 {
			
			let randomIndex = Int(arc4random() % 4)
			random3Word.insert(selectedWord, at: randomIndex)
			
			return (word: selectedWord, arrayWord: random3Word)
		}
        
        return (word: nil, arrayWord: [])
    }
    
    
    
}



