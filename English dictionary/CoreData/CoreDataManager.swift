//
//  CoreDataManager.swift
//  slavNeft
//
//  Created by Александр Нейфельд on 28.07.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import UIKit
import CoreData

var defaultContext: NSManagedObjectContext? {
    return CoreDataManager.shared.managedObjectContext
}

class CoreDataManager: NSObject {

    static let shared = CoreDataManager()
    
    private(set) var managedObjectContext: NSManagedObjectContext?

    lazy private var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func initialize() {
        managedObjectContext = nil
        managedObjectContext = self.persistentContainer.viewContext
    }
    
    
    func deleteAll(ctx: NSManagedObjectContext?){

        guard let ctx = ctx ?? defaultContext else {
            return
        }
        
        let allEntity: [String] = [Word.entityName]
        
        allEntity.forEach { (name) in
            
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: name)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try ctx.execute(deleteRequest)
            } catch {
                print("-----------------------------")
                print("ошибка при удалении всех проперти кор даты")
            }
            
        }
        
    }
    
//    private func deleteObj(deleteArray: [NSManagedObject], ctx: NSManagedObjectContext){
//
//        for object in deleteArray {
//            ctx.delete(object)
//        }
//
//        do {
//            try ctx.save()
//            print("saved!")
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        } catch {
//            print("просто ошибка")
//        }
//    }


}


