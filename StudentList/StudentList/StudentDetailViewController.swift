//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Carlotta Chen on 1/13/22.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    override func viewDidLoad() {   //if view loads
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let student = student, isViewLoaded else { return }
        firstNameLabel.text = student.firstName
        lastNameLabel.text = student.lastName
        ageLabel.text = "\(student.age)" // must make age a string to display
    }

    var student: Student? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
}
