//
//  Extensions.swift
//  Launches
//
//  Created by Adrian Tineo on 02.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        return formatter.string(from: self)
    }
}

extension DateFormatter {
    static let fullISO8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

extension Int {
    var formatted: String {
        let sign = self >= 0 ? "+" : ""
        return "T" + sign + "\(self)"
    }
}

extension Bool {
    var formatted: String {
        return self ? "Succeeded" : "Failed"
    }
}

extension Color {
    static var firefly: Color {
        Color("Firefly")
    }
    
    static var bigStone: Color {
        Color("Big Stone")
    }
    
    static var loblolly: Color {
        Color("Loblolly")
    }
}

extension UIColor {
    static var firefly: UIColor {
        UIColor(named: "Firefly")!
    }
}
