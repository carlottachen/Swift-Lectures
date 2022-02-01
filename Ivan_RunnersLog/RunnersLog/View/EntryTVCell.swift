//
//  EntryTVCell.swift
//  RunnersLog
//
//  Created by Ivan Ramirez on 1/27/22.
//

import UIKit

class EntryTVCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!

    var entry: Entry? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let entry = entry else { return }
        dateLabel.text = entry.date?.asString
        distanceLabel.text = entry.distance
    }
}
