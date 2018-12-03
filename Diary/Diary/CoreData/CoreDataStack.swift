//
//  CoreDataStack.swift
//  Diary
//
//  Created by Sebastian on 12/3/18.
//  Copyright © 2018 mezzoSoprano. All rights reserved.
//

import UIKit
import CoreData

final class CoreDataStack {
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Diary")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
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
    
    func add (name: String, text: String) {
        let context = coreData.persistentContainer.viewContext
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context)
        
        newNote.setValue(name, forKey: "name")
        newNote.setValue(text, forKey: "text")
        do {
            try context.save()
        }
        catch {
            print("Context save error")
        }
    }
    
    func delete () {
        let context = coreData.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        request.returnsObjectsAsFaults = false
        do {
            let results =  try context.fetch(request)
            if (results.count > 0 && selectedItemIndex != nil) {
                let result = results[selectedItemIndex!] as! NSManagedObject
                context.delete(result)
            }
            try context.save()
        } catch {
            print("Error while deleting data")
        }
    }
    
    func edit (name: String, text: String) {
        let context = coreData.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        request.returnsObjectsAsFaults = false
        do {
            let results =  try context.fetch(request)
            if (results.count > 0 && selectedItemIndex != nil) {
                let result = results[selectedItemIndex!] as! NSManagedObject
                result.setValue(name, forKey: "name")
                result.setValue(text, forKey: "text")
            }
            
            try context.save()
            
        } catch {
            print("Error while deleting data")
        }
    }
}
