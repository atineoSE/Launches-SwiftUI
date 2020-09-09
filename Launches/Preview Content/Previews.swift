//
//  Previews.swift
//  Launches
//
//  Created by Adrian Tineo on 08.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import SwiftUI

// MARK: - View
extension View {
    func previewWithName(_ name: String) -> some View {
        self
            .padding()
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
    }
}

