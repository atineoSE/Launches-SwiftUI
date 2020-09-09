//
//  LaunchHeaderView.swift
//  Launches
//
//  Created by Adrian Tineo on 09.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import SwiftUI

struct LaunchHeaderView: View {
    let patchImage: UIImage?
    let missionTitle: String
    let date: String
    let succeeded: String
    
    var body: some View {
        VStack {
            Image(uiImage: patchImage ?? UIImage())
                .resizable()
                .frame(width: 128, height: 128)
            
            Text(missionTitle)
                .font(.title)
                .foregroundColor(.white)
            
            Text(date)
                .foregroundColor(.loblolly)
            
            Text(succeeded)
                .foregroundColor(.loblolly)
        }
        .padding([.top, .bottom], 32.0)
        .background(Color.black)
    }
}

struct LaunchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchHeaderView(patchImage: TestData.launchOne.patch,
                         missionTitle: TestData.launchOne.missionName,
                         date: TestData.launchOne.date.formatted,
                         succeeded: TestData.launchOne.succeeded.formatted)
            .previewWithName("Launch header")
    }
}
