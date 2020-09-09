//
//  LaunchSummary.swift
//  Launches
//
//  Created by Adrian Tineo on 08.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import UIKit

struct LaunchSummary: Identifiable {
    let id: Int
    let patchImage: UIImage
    let missionTitle: String
    let launchDate: Date
    let didSucceed: Bool
}
