//
//  AllThemes.swift
//  English dictionary
//
//  Created by Hudihka on 01/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation

class AllThemes{
	
	static let jsonAllContent: [JSON] = [
		NotTheme.allContent,
        BodyParts.allContent,
        ProfessionAndWork.allContent,
        Verbs.allContent,
        DestinationsAndLocations.allContent,
        Food.allContent,
        Clothes.allContent,
        Time.allContent,
        Funiture.allContent,
        Prepositions.allContent,
        Phrases.allContent,
        Subjects.allContent,
        FamilyAndHobbies.allContent,
        Adjectives.allContent,
		December2020.allContent,
        Januri2021.allContent,
		Februaru2021.allContent,
		March2021.allContent
	]
    
    static var count: Int{
        
        var count = 0
        AllThemes.jsonAllContent.forEach { (json) in
            if let wordsJSON = json["allWords"] as? [JSON]{
                count += wordsJSON.count
            }
        }
        
        return count
    }
	
	
	
	
}
