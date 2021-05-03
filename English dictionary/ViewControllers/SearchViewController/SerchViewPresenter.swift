//
//  SerchViewPresenter.swift
//  English dictionary
//
//  Created by Hudihka on 25/04/2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation
import UIKit

//выходные значения
protocol SertchViewProtocol: class {
    func allWords(words: [Word])
	func reloadTranslate(words: [Word])
	var hideLabel: Bool {get set}
}


//абстрактный класс для наследования
//по нажатию на кнопки начинаем обрабатывать
//события этого протокола
//этот протокол обьект которого мы создаем в классе
protocol SertchViewPresenterProtocol: class {
    init(view: SertchViewProtocol, selectedTheme: [Theme], favorit: Bool)
    func tapedLike(word: Word)
	func sertchText(_ text: String?)
	func selectedRussia(rusValue: Int)
	func hideSwitch(hide: Bool)
}


//это то что инжектим

class SertchPresenter: SertchViewPresenterProtocol {
	
	
	private var selectedTheme = [Theme]()
    private var favorit = false
	private var words = [Word]()
	
	
	private var defUt = DefaultUtils.shared
	var hideTranslate = true
	var rusTranslate = 0
	
	let view: SertchViewProtocol
	
	required init(view: SertchViewProtocol, selectedTheme: [Theme], favorit: Bool) {
		self.view = view
		self.selectedTheme = selectedTheme
		self.favorit = favorit
		
		hideTranslate = defUt.hideTranslate
		rusTranslate = defUt.translateWay
	}
	
	func tapedLike(word: Word) {
		
	}
	
	func sertchText(_ text: String?) {
		reloadAllData(text: text)
	}
	
	func selectedRussia(rusValue: Int) {
		self.defUt.translateWay = rusValue
		self.rusTranslate = rusValue
		
		reloadAllData(text: nil)
	}
	
	func hideSwitch(hide: Bool) {
		self.defUt.hideTranslate = hide
		self.hideTranslate = hide
	}
	
    
	private func reloadAllData(text: String?){
		self.words = Word.words(text: text,
	                                    themes: selectedTheme,
	                                    favorite: favorit,
	                                    rusValue: rusTranslate == 0,
	                                    sorted: true)
	
		view.allWords(words: self.words)
		view.hideLabel = self.words.isEmpty
	}
    
    

 
    
    
    
    
    
    
}
