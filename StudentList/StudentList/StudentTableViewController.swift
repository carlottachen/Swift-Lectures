//
//  StudentTableViewController.swift
//  StudentList
//
//  Created by Carlotta Chen on 1/13/22.
//

import UIKit

class StudentTableViewController: UITableViewController {

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StudentController.students.count //get number from StudentController file
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        // Main -> Student Table View Controller -> Table View -> "StudentCell"
        // Configure the cell...
        
        // get the student associated with this row
        let student = StudentController.students[indexPath.row]
        cell.textLabel?.text = student.firstName    //textLabel is an optional
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let tappedIndexPath = tableView.indexPathForSelectedRow else { return }
                //this will be index path for row clicked on
                // use guard else {} in case the tapped path is nil
        let student = StudentController.students[tappedIndexPath.row]
        if let detailVC = segue.destination as? StudentDetailViewController {
            detailVC.student = student
        }
        
    }
    

}
