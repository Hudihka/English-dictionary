//
//  BodyParts.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation

class BodyParts {
    
    public static let allContent: JSON = ["theme" : "Части тела", "allWords" : BodyParts.words]
    
    private static let words: [JSON] = [
        ["engValue" : "eye", "rusValue" : "глаз", "descript" : ""],
        ["engValue" : "eyes", "rusValue" : "глаза", "descript" : ""],
        ["engValue" : "ear", "rusValue" : "ухо", "descript" : ""],
        ["engValue" : "toothache", "rusValue" : "зубная боль", "descript" : ""],
        ["engValue" : "ache", "rusValue" : "боль", "descript" : ""],
        ["engValue" : "stomack", "rusValue" : "желудок", "descript" : ""],
        ["engValue" : "bleed", "rusValue" : "кровоточить", "descript" : ""],
        ["engValue" : "tears", "rusValue" : "слезы", "descript" : ""],
        ["engValue" : "nose", "rusValue" : "нос", "descript" : ""],
        ["engValue" : "hair", "rusValue" : "волосы", "descript" : ""],
        ["engValue" : "lips", "rusValue" : "губы", "descript" : ""],
        ["engValue" : "neck", "rusValue" : "шея", "descript" : ""],
        ["engValue" : "forehead", "rusValue" : "лоб", "descript" : ""],
        ["engValue" : "eyebrow", "rusValue" : "бровь", "descript" : ""],
        ["engValue" : "eyelashes", "rusValue" : "ресница", "descript" : ""],
        ["engValue" : "leg", "rusValue" : "нога", "descript" : ""]
    ]
    
}
