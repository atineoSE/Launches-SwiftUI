//
//  HostingController.swift
//  Launches
//
//  Created by Adrian Tineo on 11.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import Foundation
import SwiftUI

class HostingController: UIHostingController<LaunchesView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
