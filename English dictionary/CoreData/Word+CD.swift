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


class Word: NSManagedObject {
    
    class var entityName: String {
        return "Word"
    }

    @NSManaged public var id: String?
    @NSManaged public var rusValue: String?
    @NSManaged public var engValue: String?
    @NSManaged public var descript: String?
    @NSManaged public var theme: String?

    
    
    private func parse(json: JSON, theme: String?){
        
        
        if let temp = json["rusValue"] as? String {
            rusValue = temp
        }
        
        if let temp = json["engValue"] as? String {
            engValue = temp
        }
        
        if let temp = json["descript"] as? String {
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
        
        let identifier: String = (json["id"] as? String) ?? ""
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
            fetchRequest.predicate = NSPredicate(format: "id == d", byId)
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
                         dontValue: Word? = nil,
                         assignedToMe: Bool? = nil,
                         assignedByMe: Bool? = nil,
                         favorite: Bool? = nil) -> NSPredicate {
        var predicates: [NSPredicate] = []

        let themes: [String] = theme.compactMap({$0.name})
        
        if themes.isEmpty == false {
            let predicateNot = NSPredicate(format: "theme in %@", themes)
            predicates.append(predicateNot)
        }
        
        if assignedToMe != nil {
            let toUser = NSPredicate(format: "toMe == %@", NSNumber(value: assignedToMe!))
            predicates.append(toUser)
        }

        if dontValue != nil {
            let toUser = NSPredicate(format: "toMe == %@", NSNumber(value: assignedToMe!))
            predicates.append(toUser)
        }
        if assignedByMe != nil {
            let byUser = NSPredicate(format: "byMe == %@", NSNumber(value:assignedByMe!))
            predicates.append(byUser)
        }
        
        if archived != nil {
            let archiveP = NSPredicate(format: "archive == %@", NSNumber(value:archived!))
            predicates.append(archiveP)
        }
        
        if favorite != nil {
            let favorits = NSPredicate(format: "favorite == %@", NSNumber(value:favorite!))
            predicates.append(favorits)
        }



        let comp = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)

        return comp
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
    

    
    
    
    
}



