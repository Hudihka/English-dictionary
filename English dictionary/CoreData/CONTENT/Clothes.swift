//
//  Clothes.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation


class Clothes {
    
    public static let allContent: JSON = ["theme" : "Одежда", "allWords" : Clothes.words]
    
    private static let words: [JSON] = [
        ["engValue" : "a thing", "rusValue" : "вещ", "descript" : ""],
        ["engValue" : "a suit", "rusValue" : "костюм", "descript" : ""],
        ["engValue" : "a shirt", "rusValue" : "рубашка", "descript" : ""],
        ["engValue" : "a t-shirt", "rusValue" : "футболка", "descript" : ""],
        ["engValue" : "a jumper", "rusValue" : "джемпер", "descript" : ""],
        ["engValue" : "a coat", "rusValue" : "пальто", "descript" : ""],
        ["engValue" : "a skirt", "rusValue" : "юбка", "descript" : ""],
        ["engValue" : "a dress", "rusValue" : "платье", "descript" : ""],
        ["engValue" : "a trousers", "rusValue" : "брюки", "descript" : ""],
        ["engValue" : "jeans", "rusValue" : "ждинсы", "descript" : ""],
        ["engValue" : "shoes", "rusValue" : "обувь", "descript" : ""],
        ["engValue" : "trainers", "rusValue" : "кроссовки", "descript" : ""],
        ["engValue" : "boots", "rusValue" : "сапоги", "descript" : ""],
        ["engValue" : "clothes ", "rusValue" : "одежда", "descript" : ""],
        ["engValue" : "shorts", "rusValue" : "шорты", "descript" : ""],
        ["engValue" : "shoes", "rusValue" : "туфли", "descript" : ""],
        ["engValue" : "skirt", "rusValue" : "юбка", "descript" : ""],
        ["engValue" : "a hat", "rusValue" : "шляпа", "descript" : ""],
        ["engValue" : "a top", "rusValue" : "верхняя одежда", "descript" : ""],
        ["engValue" : "a cap", "rusValue" : "кепка/шапка", "descript" : ""],
        ["engValue" : "hood", "rusValue" : "капюшон", "descript" : ""],
        ["engValue" : "hoody", "rusValue" : "худи/толстовка", "descript" : ""]
    
    ]
    
}
