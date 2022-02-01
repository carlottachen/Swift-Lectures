//
//  Extensions.swift
//  RunnersLog
//
//  Created by Ivan Ramirez on 1/27/22.
//

import Foundation

extension Date {

    var asString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium

        return formatter.string(from: self)
    }

}
