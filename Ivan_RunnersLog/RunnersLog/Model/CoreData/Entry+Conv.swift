//
//  Entry+Conv.swift
//  RunnersLog
//
//  Created by Ivan Ramirez on 1/27/22.
//


import CoreData


extension Entry {

    @discardableResult

    convenience init(distance: String, latitude: Double, longitude: Double, showLocation: Bool, date: Date, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {

        self.init(context: context)
        self.distance = distance
        self.latitude = latitude
        self.longitude = longitude
        self.showLocation = showLocation
        self.date = date
    }
}
