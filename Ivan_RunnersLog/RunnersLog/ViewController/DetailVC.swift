//
//  DetailVC.swift
//  RunnersLog
//
//  Created by Ivan Ramirez on 1/27/22.
//

import UIKit
import MapKit

class DetailVC: UIViewController {

    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var locationSwitch: UISwitch!

    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    func updateViews() {
        guard let entry = entry else {
            // we need to do something in here regarding the switch
            return
        }
        distanceTextField.text = entry.distance
        locationSwitch.isOn = entry.showLocation
    }
    

    @IBAction func switchTapped(_ sender: Any) {
    }

    @IBAction func saveButtonTapped(_ sender: Any) {

        // check if the text field is blank
        guard let distance = distanceTextField.text, !distance.isEmpty else { return }
        // Update
        if let entry = self.entry {
            EntryController.shared.UpdateEntry(entry: entry, showLocation: locationSwitch.isOn, distance: distance)
        } else {
            // or Save
            let newEntry = Entry(distance: distance, latitude: 3.0, longitude: 3.5, showLocation: locationSwitch.isOn, date: Date())

            EntryController.shared.createEntry(entry: newEntry)
        }

        // Exit
        dismiss(animated: true, completion: nil)

        //TODO - need to reload table view

        NotificationCenter.default.post(name: Notification.Name("RefreshNotificationIdentifier"), object: nil)
    }

}
