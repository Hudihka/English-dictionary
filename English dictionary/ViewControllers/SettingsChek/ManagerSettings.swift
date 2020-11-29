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
    
    private var rusAnglTranslate = true
    private var visibleStatistic = true
    private var oneThemeQestion = false
    
    func createTheme(selectedTheme: [Theme]){
        
        self.rusAnglTranslate = true
        self.visibleStatistic = true
        self.oneThemeQestion = false
        
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
    
}
