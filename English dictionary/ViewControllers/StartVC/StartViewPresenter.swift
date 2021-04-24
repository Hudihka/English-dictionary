//
//  StartViewPresenter.swift
//  English dictionary
//
//  Created by Админ on 24.04.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation
import UIKit

//выходные значения
protocol StartViewProtocol: class {
    func reloadSelectedThemes(themes: [Theme])
    func allThemes(themes: [Theme])
    func selectedFavorite(selectedFavorite: Bool)
}


//абстрактный класс для наследования
//по нажатию на кнопки начинаем обрабатывать
//события этого протокола
//этот протокол обьект которого мы создаем в классе
protocol StartViewPresenterProtocol: class {
    init(view: StartViewProtocol)
    func selected(themes: Theme)
    func tapedFavorit()
    func clearAll()
    func getAllThemes()
    func selectedAll()
}


//это то что инжектим

class StartPresenter: StartViewPresenterProtocol {
    
    let view: StartViewProtocol
    
    private var allThemes: [Theme] = []
    private var selectedFavorite = false
    
    var selectedThemes: [Theme] = []
    
    required init(view: StartViewProtocol) {
        self.view = view
    }
    
    func selected(themes: Theme) {
        if selectedThemes.contains(themes){
            selectedThemes = selectedThemes.filter({$0.name != themes.name})
        } else {
            selectedThemes.append(themes)
        }
        
        view.reloadSelectedThemes(themes: selectedThemes)
    }
    
    func getAllThemes() {
        allThemes = Theme.findAll()
        view.allThemes(themes: allThemes)
    }
    
    func selectedAll() {
        selectedThemes = allThemes
        view.reloadSelectedThemes(themes: selectedThemes)
    }
    
    func clearAll() {
        selectedThemes = []
        view.reloadSelectedThemes(themes: selectedThemes)
    }
    
    func tapedFavorit(){
        selectedFavorite = !selectedFavorite
        view.selectedFavorite(selectedFavorite: selectedFavorite)
    }
    
    
    
    
    
    
}
