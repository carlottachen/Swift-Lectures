//
//  Student.swift
//  StudentList
//
//  Created by Carlotta Chen on 1/13/22.
//

import Foundation


// this is our model that holds the info
class Student {
    
    init(firstName: String, lastName: String, age: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    let firstName: String
    let lastName: String
    let age: Int
}

