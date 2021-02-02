//
//  Januri2021.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation


class Januri2021 {
    
    public static let allContent: JSON = ["theme" : "2021 январь", "allWords" : Januri2021.words]
    
    private static let words: [JSON] = [
        ["engValue" : "few", "rusValue" : "несколько", "descript" : ""],
        ["engValue" : "noticed", "rusValue" : "заметил", "descript" : ""],
        ["engValue" : "notice", "rusValue" : "замечать", "descript" : ""],
        ["engValue" : "thought", "rusValue" : "подумал", "descript" : ""],
        ["engValue" : "felt", "rusValue" : "чавствовал", "descript" : ""],
        ["engValue" : "illnes", "rusValue" : "болезнь", "descript" : ""],
        ["engValue" : "autumn", "rusValue" : "осень", "descript" : ""],
        ["engValue" : "shorter", "rusValue" : "короче", "descript" : ""],
        ["engValue" : "bright", "rusValue" : "яркий", "descript" : ""],
        ["engValue" : "bleak", "rusValue" : "тусклый", "descript" : ""],
        ["engValue" : "whole", "rusValue" : "весь/целый", "descript" : ""],
        ["engValue" : "enought", "rusValue" : "достаточно", "descript" : ""],
        ["engValue" : "weather", "rusValue" : "погода", "descript" : ""],
        ["engValue" : "warm", "rusValue" : "теплый", "descript" : ""],
        ["engValue" : "wet", "rusValue" : "влажный", "descript" : ""],
        ["engValue" : "dry", "rusValue" : "сухой", "descript" : ""],
        ["engValue" : "raining", "rusValue" : "идет дождь", "descript" : ""],
        ["engValue" : "snowing", "rusValue" : "идет снег", "descript" : ""],
        ["engValue" : "windy", "rusValue" : "ветренный", "descript" : ""],
        ["engValue" : "cloudy", "rusValue" : "облачно", "descript" : ""],
        ["engValue" : "sunny", "rusValue" : "солнечно", "descript" : ""],
        ["engValue" : "gedrees", "rusValue" : "градус", "descript" : ""],
        ["engValue" : "bellow", "rusValue" : "ниже/под", "descript" : ""],
        ["engValue" : "above", "rusValue" : "выше/над", "descript" : ""],
        ["engValue" : "blow", "rusValue" : "дуть", "descript" : ""],
        ["engValue" : "shine", "rusValue" : "светить", "descript" : ""],
        ["engValue" : "metter", "rusValue" : "дело", "descript" : ""],
        ["engValue" : "hand", "rusValue" : "кисть", "descript" : ""],
        ["engValue" : "relaible", "rusValue" : "надежный", "descript" : ""],
        ["engValue" : "What is he/she/it like?", "rusValue" : "каков он/она/она по характеру?", "descript" : ""],
        ["engValue" : "What does he/she look like?", "rusValue" : "как он/она выглядит?", "descript" : ""],
        ["engValue" : "What does he/she like doing?", "rusValue" : "что он/она любят делать?", "descript" : ""],
        ["engValue" : "sail", "rusValue" : "парусный спорт", "descript" : ""],
        ["engValue" : "sale", "rusValue" : "распродажа", "descript" : ""],
        ["engValue" : "hard", "rusValue" : "трудный/тяжелый", "descript" : ""],
        ["engValue" : "hard", "rusValue" : "тяжело/усердно", "descript" : ""],
        ["engValue" : "celebrate", "rusValue" : "праздновать", "descript" : ""],
        ["engValue" : "resolution", "rusValue" : "обещания", "descript" : ""],
        ["engValue" : "hander", "rusValue" : "еще больше/усердно", "descript" : ""],
        ["engValue" : "gain", "rusValue" : "набрать/получить", "descript" : ""],
		["engValue" : "tomorrow", "rusValue" : "завтра", "descript" : ""],
		["engValue" : "revise for", "rusValue" : "готовиться к чему то", "descript" : ""],
		["engValue" : "take an exam", "rusValue" : "сдавать экзамен", "descript" : ""],
		["engValue" : "pass an exam", "rusValue" : "сдать экзамен", "descript" : ""],
		["engValue" : "a degree", "rusValue" : "степень", "descript" : ""],
		["engValue" : "mean", "rusValue" : "значит", "descript" : ""],
		["engValue" : "hera", "rusValue" : "слышать", "descript" : ""],
		["engValue" : "hair", "rusValue" : "волосы", "descript" : ""],
		["engValue" : "liberty", "rusValue" : "свобода", "descript" : ""],
		["engValue" : "earn", "rusValue" : "заработать", "descript" : ""],
		["engValue" : "earn a fortune", "rusValue" : "заработат состояние", "descript" : ""],
		["engValue" : "fortune", "rusValue" : "состояние", "descript" : ""],
		["engValue" : "might", "rusValue" : "возможно", "descript" : ""],
		["engValue" : "decided", "rusValue" : "уверен", "descript" : ""],
		["engValue" : "deci", "rusValue" : "решать", "descript" : ""],
		["engValue" : "meal", "rusValue" : "еда", "descript" : ""],
		["engValue" : "certain", "rusValue" : "определенный", "descript" : ""],
		["engValue" : "define", "rusValue" : "определенных", "descript" : ""],
		["engValue" : "could", "rusValue" : "мог", "descript" : ""],
		["engValue" : "finding your way", "rusValue" : "найти дорогу", "descript" : ""],
		["engValue" : "equipped", "rusValue" : "оборудованный", "descript" : ""],
		["engValue" : "equip", "rusValue" : "оборудование", "descript" : ""],
		["engValue" : "large", "rusValue" : "большой", "descript" : ""],
		["engValue" : "dining area", "rusValue" : "обеденная зона", "descript" : ""],
		["engValue" : "avaliable", "rusValue" : "доступный", "descript" : ""],
		["engValue" : "near", "rusValue" : "рядом", "descript" : ""],
		["engValue" : "justified", "rusValue" : "оправданно", "descript" : ""],
		["engValue" : "opposite", "rusValue" : "напротив", "descript" : ""],
		["engValue" : "bridge", "rusValue" : "мост", "descript" : ""],
    
    ]
    
}
