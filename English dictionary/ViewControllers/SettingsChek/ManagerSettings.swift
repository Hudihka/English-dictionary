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
    
    private var selectedTheme = [Theme]()
    
    var rusAnglTranslate = true
    private var visibleStatistic = true
    private var oneThemeQestion = false
    
    private var countWord = 0
    private var countError = 0
    
    func createTheme(selectedTheme: [Theme]){
        
        self.rusAnglTranslate = true
        self.visibleStatistic = true
        self.oneThemeQestion = false
        
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
        
        return "Слов: \(countWord)/nОшибок: \(countError)"
    }
    
}
