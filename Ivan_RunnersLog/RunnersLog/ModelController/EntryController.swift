//
//  EntryController.swift
//  RunnersLog
//
//  Created by Ivan Ramirez on 1/27/22.
//

import Foundation
import CoreData

class EntryController {

    static let shared = EntryController()

    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")

        // Look this up on why value is true, what if its false, does it change anything??
        request.predicate = NSPredicate(value: true)

        return request
    } ()


    // Fetch Entries
    var fetchedEntries: [Entry] {
        do {
            return try CoreDataStack.managedObjectContext.fetch(self.fetchRequest)
        } catch {
            print("Error fetching entries: \(error.localizedDescription)")
            return []
        }
    }



    // Create Entry
    func createEntry(entry: Entry) {
        CoreDataStack.saveContext()
    }

    // Update Entry
    func UpdateEntry(entry: Entry, showLocation: Bool, distance: String) {

        entry.showLocation = showLocation
        entry.distance = distance

        CoreDataStack.saveContext()
    }

    // Delete a single Entry
    func removeEntry(entry: Entry) {
        if let moc = entry.managedObjectContext {
            moc.delete(entry)

            CoreDataStack.saveContext()
        }
    }

    // Sort Entries
    func sortEntries(ascending: Bool) {

        let sortDescriptor = NSSortDescriptor(key: "date", ascending: ascending)

        fetchRequest.sortDescriptors = [sortDescriptor]

        do {
            try CoreDataStack.managedObjectContext.fetch(fetchRequest)
        } catch {
            print("There was an error sorting the entries: \(error.localizedDescription)")
        }
    }

    // Delete All Entries

    func deleteEverything() {

        // Specify a batch to delete with a fetch request
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = NSFetchRequest(entityName: "Entry")

        // Create a batch delete request for the
        // fetch request
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        // Specify the result of the NSBatchDeleteRequest
        // should be the NSManagedObject IDs for the
        // deleted objects
        deleteRequest.resultType = .resultTypeObjectIDs

        // Get a reference to a managed object context
        let context = CoreDataStack.managedObjectContext

        // Perform the batch delete
        do {
        let batchDelete = try context.execute(deleteRequest)
            as? NSBatchDeleteResult

        guard let deleteResult = batchDelete?.result
            as? [NSManagedObjectID]
            else { return }

            let deletedObjects: [AnyHashable: Any] = [
                NSDeletedObjectsKey: deleteResult
            ]
            // Merge the delete changes into the managed
            // object context
            NSManagedObjectContext.mergeChanges(
                fromRemoteContextSave: deletedObjects,
                into: [context]
            )
            } catch {
                print(error.localizedDescription)
            }
    }
}

