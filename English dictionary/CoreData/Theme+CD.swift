//
//  Theme+CoreDataClass.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Theme)
class Theme: NSManagedObject {
    
    class var entityName: String {
        return "Theme"
    }

    @NSManaged public var name: String?
    @NSManaged public var words: Set<Word>?

    
    private func parse(json: JSON){
        
        if let temp = json["theme"] as? String {
            name = temp
        }
        
        if let allWords = json["allWords"] as? [JSON]{
            let wordsInTheme = Word.findCreate(jsonArray: allWords, theme: self.name)
            words = Set(wordsInTheme)
        }
        
    }
        
    //MARK: CREATE
    
    @discardableResult static func findCreate(jsonArray: [JSON], context: NSManagedObjectContext? = nil) -> [Theme] {
        return jsonArray.map({Theme.findCreate(json: $0, context: context)})
    }
    
    
    @discardableResult static func findCreate(json: JSON, context: NSManagedObjectContext? = nil) -> Theme {
        
        let identifier: String = (json["theme"] as? String) ?? ""
        let ctx = context ?? defaultContext
        var object: Theme? = find(byId: identifier, context: ctx)
        
        if object == nil, ctx != nil {
            let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: ctx!)!
            object = Theme(entity: entityDescription, insertInto: ctx)
        }
        
        object?.parse(json: json)
        
        return object!
    }
    
    static func find(byId: String, context: NSManagedObjectContext? = nil) -> Theme? {
        
        guard let ctx = context ?? defaultContext else {return nil}
        
        var objects: [Theme]?
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            fetchRequest.predicate = NSPredicate(format: "name == %@", byId)
            try objects = ctx.fetch(fetchRequest) as? [Theme]
        } catch {
            print(error)
        }
        
        return objects?.first
    }
    
    
    
    static func findAll(by: NSPredicate? = nil, context: NSManagedObjectContext? = nil) -> [Theme] {
        guard let ctx = context ?? defaultContext else {return []}

        var objects: [Theme]?
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let sortDescriptors = NSSortDescriptor(key: "name", ascending: false)
            fetchRequest.predicate = by
            fetchRequest.sortDescriptors = [sortDescriptors]
            try objects = ctx.fetch(fetchRequest) as? [Theme]
        } catch {
            print(error)
        }
        
        if let objects = objects{
            let noNAmeTheme = objects.filter({$0.name == "Без темы"})
            let nameTheme = objects.filter({$0.name != "Без темы"})
            
            return noNAmeTheme + nameTheme
        }

        return []
    }
    
    //MARK: DELETE
    
//    class func remove(_ form: [Form], context: NSManagedObjectContext? = nil) {
//        guard let ctx = context ?? defaultContext else {return}
//        form.forEach({ctx.delete($0)})
//    }
    
    static func delete(by: NSPredicate? = nil, context: NSManagedObjectContext? = nil) {
        guard let ctx = context ?? defaultContext else {return}
        
        var objects: [Theme]?
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            fetchRequest.predicate = by
            try objects = ctx.fetch(fetchRequest) as? [Theme]
        } catch {
            print(error)
        }
        
        objects?.forEach({Theme.remove($0, context: ctx)})
    }
    
    class func remove(_ form: Theme, context: NSManagedObjectContext? = nil) {
        
        guard let ctx = context ?? defaultContext else {return}
        ctx.delete(form)
    }
    
}

