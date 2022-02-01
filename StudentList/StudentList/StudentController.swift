//
//  StudentController.swift
//  StudentList
//
//  Created by Carlotta Chen on 1/13/22.
//

import Foundation


// maintains list of model objects
class StudentController {
    static var students: [Student] {
        return [
            Student(firstName: "Carlotta", lastName: "Chen", age: 29),
            Student(firstName: "Steve", lastName: "Jobs", age: 62),
            Student(firstName: "Peter", lastName: "Oh", age: 30),
            Student(firstName: "Ruby", lastName: "Chen", age: 31)
        ]
    }
}
