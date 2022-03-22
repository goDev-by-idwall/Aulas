//
//  ManagedObjectContext.swift
//  Aula 9
//
//  Created by Felipe Brigagão de Almeida on 21/03/22.
//

import UIKit
import CoreData

typealias onCompletionHandler = (String) -> Void

protocol managedProtocol {
    func getAllPersons() -> [Person]
}

protocol managedSavedProtocol {
    func save(person: Person, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func delete(uuid: String, onCompletionHandler: onCompletionHandler)
}

class ManagedObjectContext {
    private let entity = "User"
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        
        return instance
    }()
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
}

extension ManagedObjectContext: managedProtocol {
    func getAllPersons() -> [Person] {
        var listPersons: [Person] = []
        
        do {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            guard let persons = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return listPersons }
            
            for item in persons {
                if let id = item.value(forKey: "id") as? UUID,
                let name = item.value(forKey: "name") as? String,
                let lastName = item.value(forKey: "lastName") as? String,
                   let age = item.value(forKey: "age") as? Int {
                    let person = Person(id: id, name: name, lastName: lastName, age: age)
                    
                    listPersons.append(person)
                }
            }
        } catch let error as NSError{
            print("Error in Request: \(error.localizedDescription)")
        }
        
        return listPersons
    }
}

extension ManagedObjectContext: managedSavedProtocol {
    func save(person: Person, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(person.id, forKey: "id")
        transaction.setValue(person.name, forKey: "name")
        transaction.setValue(person.lastName, forKey: "lastName")
        transaction.setValue(person.age, forKey: "age")
        
        do {
            try context.save()
            onCompletionHandler("Save Success")
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
}

extension ManagedObjectContext: managedDeleteProtocol {
    func delete(uuid: String, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        let predicate = NSPredicate(format: "ïd == %@", "\(uuid)")
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        
        fetchRequest.predicate = predicate
        
        do {
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            onCompletionHandler("Delete Success")
        } catch let error as NSError {
            print("Fetch Failed: \(error.localizedDescription)")
        }
    }
}
