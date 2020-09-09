//
//  LaunchInfoView.swift
//  Launches
//
//  Created by Adrian Tineo on 07.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import SwiftUI

struct LaunchInfoView: View {
    let patchImage: UIImage?
    let title: String
    let subtitle: String
    let status: String
    let isDetailInfo: Bool
    
    var body: some View {
        HStack {
            Image(uiImage: patchImage ?? UIImage())
                .resizable()
                .foregroundColor(.white)
                .frame(width: 48.0, height: 48.0)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(isDetailInfo ? .white : .loblolly)
                
                Text(status)
                    .font(.caption)
                    .foregroundColor(isDetailInfo ? .white : .loblolly)
            }
        }
        .padding([.top, .bottom])
    }
}

struct LaunchInfoView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            LaunchInfoView(patchImage: #imageLiteral(resourceName: "falconsat"),
                           title: TestData.launchOne.missionName,
                           subtitle: TestData.launchOne.date.formatted,
                           status: TestData.launchOne.succeeded.formatted,
                           isDetailInfo: false)
                .background(Color.bigStone)
                .previewWithName("Succeeded launch")
            
                LaunchInfoView(patchImage: #imageLiteral(resourceName: "Payload"),
                           title: "Payload deployment",
                           subtitle: "Time: T+180",
                           status: "Payloads: CRS-1", isDetailInfo: true)
                .background(Color.black)
                .previewWithName("Info item")
        }
    }
}
