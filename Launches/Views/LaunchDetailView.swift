//
//  LaunchDetailView.swift
//  Launches
//
//  Created by Adrian Tineo on 09.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import SwiftUI

struct LaunchDetailView: View {
    @State var launch: Launch
    @State var hasFetchedImage: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .frame(height: 64.0)
                    .background(Color.black)
                
                LaunchHeaderView(
                    patchImage: hasFetchedImage ? launch.patch : UIImage(),
                    missionTitle: launch.missionName,
                    date: launch.date.formatted,
                    succeeded: launch.succeeded.formatted)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center)
                
                LaunchInfoView(
                    patchImage: #imageLiteral(resourceName: "Payload"),
                    title: "Payload deployment",
                    subtitle: "Time: \(launch.timeline?.payloadDeploy?.formatted ?? "")" ,
                    status: "Payloads: \(launch.payloads)",
                    isDetailInfo: true)
                    .background(Color.black)
                    .padding([.leading, .trailing])
                
                Image(uiImage: #imageLiteral(resourceName: "Earth"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                ZStack (alignment: .leading) {
                    VStack (spacing: 0.0) {
                        LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: UnitPoint(x: 0.0, y: 0.0), endPoint: UnitPoint(x: 0.0, y: 1.0))
                        
                        LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: UnitPoint(x: 0.0, y: 0.0), endPoint: UnitPoint(x: 0.0, y: 1.0))
                    }
                    
                    VStack (alignment: .leading, spacing: 0.0) {
                        LaunchInfoView(patchImage: #imageLiteral(resourceName: "Cutoff"),
                                       title: "Main Engine Cutoff",
                                       subtitle: "Time: \(launch.timeline?.mainEngineCutoff?.formatted ?? "")" ,
                            status: "",
                            isDetailInfo: true)
                        
                        LaunchInfoView(patchImage: #imageLiteral(resourceName: "Liftoff"),
                                       title: "Liftoff",
                                       subtitle: "Time: \(launch.timeline?.liftoff?.formatted ?? "")" ,
                            status: "Rocket: \(launch.rocket)",
                            isDetailInfo: true)
                        
                        LaunchInfoView(patchImage: #imageLiteral(resourceName: "Loading"),
                                       title: "Propellant Loading",
                                       subtitle: "Time: \(launch.timeline?.propellerLoading?.formatted ?? "")" ,
                            status: "Site: \(launch.site)",
                            isDetailInfo: true)
                        
                        Rectangle()
                            .listRowInsets(.init())
                            .foregroundColor(Color.clear)
                            .frame(height: 185)
                    }
                    .padding([.leading, .trailing])
                }
                .background(Color.clear)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
        .navigationBarTitle("Launch details", displayMode: .inline)
        .onAppear(perform: setStaticColors)
        .onAppear(perform: fetchLaunch)
    }
}

private extension LaunchDetailView {
    func setStaticColors() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    func fetchLaunch() {
        let url = URL(string: "https://api.spacexdata.com/v3/launches")!
            .appendingPathComponent("\(launch.id)")
        let request = NetworkRequest(url: url)
        request.execute { (data) in
            if let data = data {
                self.decode(data)
            }
        }
    }
    
    func decode(_ data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
        do {
            launch = try decoder.decode(Launch.self, from: data)
            fetchPatch(url: launch.patchURL)
        } catch {}
    }
    
    
    func fetchPatch(url: URL) {
        let request = NetworkRequest(url: url)
        request.execute { (data) in
            guard let data = data else {
                return
            }
            self.hasFetchedImage = true
            self.launch.patch = UIImage(data: data)
        }
    }
    
}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LaunchDetailView(launch: TestData.launchOne)
        }
        .previewWithName("Launch details")
        .frame(height: 1200)
    }
}
