//
//  TestData.swift
//  Launches
//
//  Created by Adrian Tineo on 02.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import Foundation

struct TestData {
    
    static let launchOne = Launch(id: 1,
                                  missionName: "FalconSat",
                                  date: Date(),
                                  succeeded: false,
                                  timeline: Timeline(propellerLoading: -2280, liftoff: 0, mainEngineCutoff: 150, payloadDeploy: 1960),
                                  rocket: "Falcon 1",
                                  site: "Kwajalein Atoll Omelek Island",
                                  patchURL: URL(string: "https://images2.imgbox.com/40/e3/GypSkayF_o.png")!,
                                  payloads: "FalconSAT-2",
                                  patch: #imageLiteral(resourceName: "falconsat"))
    
    static let launchTwo = Launch(id: 2,
                                  missionName: "DemoSat",
                                  date: Date(),
                                  succeeded: true,
                                  timeline: Timeline(propellerLoading: -2280, liftoff: 0, mainEngineCutoff: 150, payloadDeploy: 1960),
                                  rocket: "Falcon 1",
                                  site: "Kwajalein Atoll Omelek Island",
                                  patchURL: URL(string: "https://images2.imgbox.com/40/e3/GypSkayF_o.png")!,
                                  payloads: "FalconSAT-2",
                                  patch: #imageLiteral(resourceName: "demosat"))
    
    static let launchThree = Launch(id: 3,
                                    missionName: "TelStar 19V",
                                    date: Date(),
                                    succeeded: true,
                                    timeline: Timeline(propellerLoading: -2280, liftoff: 0, mainEngineCutoff: 150, payloadDeploy: 1960),
                                    rocket: "Falcon 1",
                                    site: "Kwajalein Atoll Omelek Island",
                                    patchURL: URL(string: "https://images2.imgbox.com/40/e3/GypSkayF_o.png")!,
                                    payloads: "FalconSAT-2",
                                    patch: #imageLiteral(resourceName: "falconsat2"))
    
    static let sampleLaunches = [TestData.launchOne, TestData.launchTwo, TestData.launchThree]
}
