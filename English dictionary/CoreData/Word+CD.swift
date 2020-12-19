//
//  Form+CoreDataClass.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Word)
class Word: NSManagedObject {
    
    class var entityName: String {
        return "Word"
    }

    @NSManaged public var id: String?
    @NSManaged public var rusValue: String?
    @NSManaged public var engValue: String?
    @NSManaged public var descript: String?
    @NSManaged public var theme: String?
    @NSManaged public var favorit: Bool
    
    
    private func parse(json: JSON, theme: String?){
        
        
		if let temp = json["rusValue"] as? String, let word = temp.textEditorFirst {
            rusValue = word
        }
        
        if let temp = json["engValue"] as? String, let word = temp.textEditorFirst  {
            engValue = word
        }
        
        if let temp = json["descript"] as? String, temp.textEditor != nil {
            descript = temp
        }
        
        if let theme = theme{
            self.theme = theme
        }
        
        
        let descriptionID = descript ?? ""
        let rusID = rusValue ?? "rusValue"
        let engID = engValue ?? "engValue"
        let themeID = self.theme ?? "Без темы"
        
        id = "\(rusID)_\(engID)_\(descriptionID)_\(themeID)"
        
    }
        
    //MARK: CREATE
    
    @discardableResult static func findCreate(jsonArray: [JSON],
                                              theme: String?,
                                              context: NSManagedObjectContext? = nil) -> [Word] {
        
        return jsonArray.map({Word.findCreate(json: $0, theme: theme, context: context)})
    }
    
    
    @discardableResult static func findCreate(json: JSON, theme: String?, context: NSManagedObjectContext? = nil) -> Word {
        
        let rusID = (json["rusValue"] as? String) ?? "rusValue"
        let descriptionID = (json["descript"] as? String)?.textEditor ?? ""
        let engID = (json["engValue"] as? String) ?? "engValue"
        let themeID = theme ?? "Без темы"
        
        let identifier: String = "\(rusID)_\(engID)_\(descriptionID)_\(themeID)"
        
        let ctx = context ?? defaultContext
        var object: Word? = find(byId: identifier, context: ctx)
        
        if object == nil, ctx != nil {
            let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: ctx!)!
            object = Word(entity: entityDescription, insertInto: ctx)
        }
        
        object?.parse(json: json, theme: theme)
        
        return object!
    }
    
    static func find(byId: String, context: NSManagedObjectContext? = nil) -> Word? {
        
        guard let ctx = context ?? defaultContext else {return nil}
        
        var objects: [Word]?
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            fetchRequest.predicate = NSPredicate(format: "id == %@", byId)
            try objects = ctx.fetch(fetchRequest) as? [Word]
        } catch {
            print(error)
        }
        
        return objects?.first
    }
    
    
    
    //предикат для поиска
//    class func predicate(theme:[Theme],
//                         dontValue: String? = nil,
    
    class func predicate(theme:[Theme],
                         favorite: Bool,
                         dontValue: Word? = nil) -> NSPredicate {
        var predicates: [NSPredicate] = []

        let themes: [String] = theme.compactMap({$0.name})
        
        if themes.isEmpty == false { //
            
            if favorite == false {
                let predicateNot = NSPredicate(format: "theme in %@", themes)
                predicates.append(predicateNot)
            } else { //можем искать и в выбранных темах и среди фаворитных
                let predicateNot = NSPredicate(format: "theme in %@ OR favorit == YES", themes)
                predicates.append(predicateNot)
            }
            
        }
        
		if let rusDont = dontValue?.rusValue {
            let toUser = NSPredicate(format: "rusValue != %@", rusDont)
            predicates.append(toUser)
        }
		
		if let engDont = dontValue?.engValue {
            let toUser = NSPredicate(format: "rusValue != %@", engDont)
            predicates.append(toUser)
        }


        let comp = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)

        return comp
    }
    
    class func favorite(theme:[Theme]) -> NSPredicate {
        var predicates: [NSPredicate] = []

        let themes: [String] = theme.compactMap({$0.name})
        
        if themes.isEmpty == false {
            let predicateNot = NSPredicate(format: "theme in %@", themes)
            predicates.append(predicateNot)
        }
        
        let favorit = NSPredicate(format: "favorit == YES")
        predicates.append(favorit)

        let comp = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)

        return comp
    }
    
    
	
	class func words(text: String?, themes: [Theme], favorite: Bool, rusValue: Bool) -> [Word]{
		
		var predicates: [NSPredicate] = []

        
        if themes.isEmpty, favorite { //только фаворит
			let favorit = NSPredicate(format: "favorit == YES")
			predicates.append(favorit)
        } else if themes.isEmpty == false, favorite { //в опр темах или фаворит
			let themes: [String] = themes.compactMap({$0.name})
            let predicateNot = NSPredicate(format: "theme in %@ OR favorit == YES", themes)
            predicates.append(predicateNot)
		} else if themes.isEmpty == false, favorite == false {
			//только в опр темах и не важно фаворит или нет
			let themes: [String] = themes.compactMap({$0.name})
            let predicateNot = NSPredicate(format: "theme in %@", themes)
            predicates.append(predicateNot)
		}
		
		if let text = text{
			let predicate = rusValue ? NSPredicate(format: "rusValue CONTAINS[c] %@", text) :
									   NSPredicate(format: "engValue CONTAINS[c] %@", text)
            predicates.append(predicate)
		}
		
		let keySortDescriptor1 = rusValue ? "rusValue" : "engValue"

		let sortDescriptors1 = NSSortDescriptor(key: keySortDescriptor1, ascending: true)
		
		let comp = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
		
		guard let ctx = defaultContext else {return []}

        var objects: [Word]?
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
			fetchRequest.fetchBatchSize = 15
            if predicates.isEmpty == false {
                fetchRequest.predicate = comp
            }
            fetchRequest.sortDescriptors = [sortDescriptors1]
            try objects = ctx.fetch(fetchRequest) as? [Word]
        } catch {
            print(error)
        }
		
		return objects ?? []
	}
    
    
    static func findAll(by: NSPredicate? = nil, context: NSManagedObjectContext? = nil) -> [Word] {
        guard let ctx = context ?? defaultContext else {return []}

        var objects: [Word]?
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let sortDescriptors = NSSortDescriptor(key: "id", ascending: false)
            fetchRequest.predicate = by
            fetchRequest.sortDescriptors = [sortDescriptors]
            try objects = ctx.fetch(fetchRequest) as? [Word]
        } catch {
            print(error)
        }

        return objects ?? []
    }
    
    //MARK: DELETE
    
//    class func remove(_ form: [Form], context: NSManagedObjectContext? = nil) {
//        guard let ctx = context ?? defaultContext else {return}
//        form.forEach({ctx.delete($0)})
//    }
    
    static func delete(by: NSPredicate? = nil, context: NSManagedObjectContext? = nil) {
        guard let ctx = context ?? defaultContext else {return}
        
        var objects: [Word]?
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            fetchRequest.predicate = by
            try objects = ctx.fetch(fetchRequest) as? [Word]
        } catch {
            print(error)
        }
        
        objects?.forEach({Word.remove($0, context: ctx)})
    }
    
    class func remove(_ form: Word, context: NSManagedObjectContext? = nil) {
        
        guard let ctx = context ?? defaultContext else {return}
        ctx.delete(form)
    }
    

    static var allCountFavorite: Int{
        
        let request = Word.favorite(theme: [])
        let count = Word.findAll(by: request, context: nil).count
        
        return count
    }
    
    
    
}



