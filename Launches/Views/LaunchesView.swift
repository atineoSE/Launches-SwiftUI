//
//  LaunchesView.swift
//  Launches
//
//  Created by Adrian Tineo on 02.08.20.
//  Copyright © 2020 matteomanferdini. All rights reserved.
//

import SwiftUI

struct LaunchesView: View {
    @State var launches: [Launch]
    @State var isShowingAlert: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.launches) { launch in
                    NavigationLink(destination: LaunchDetailView(launch: launch)) {
                        LaunchInfoView(
                            patchImage: launch.patch,
                            title: launch.missionName,
                            subtitle: launch.date.formatted,
                            status: launch.succeeded.formatted,
                            isDetailInfo: false)
                    }
                }
                .listRowBackground(Color.bigStone)
                
                Rectangle()
                    .listRowInsets(.init())
                    .foregroundColor(Color.firefly)
                
            }
            .navigationBarTitle("Launches")
        }
        .onAppear(perform: setStaticColors)
        .onAppear(perform: fetchLaunches)
        .alert(isPresented: $isShowingAlert){
            Alert(title: Text("Oops, something went wrong"),
                  message: Text("Please make sure you have the latest version of the app"),
                  dismissButton: .default(Text("Ok")))
        }
    }
}

private extension LaunchesView {
    
    func setStaticColors() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .firefly
    }
    
    func fetchLaunches() {
        let url = URL(string: "https://api.spacexdata.com/v3/launches?limit=10")!
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
            launches = try decoder.decode([Launch].self, from: data)
            launches.forEach { launch in
                fetchPatch(url: launch.patchURL, launchId: launch.id)
            }
        } catch {
            isShowingAlert = true
        }
    }
    
    func fetchPatch(url: URL, launchId: Int) {
        let request = NetworkRequest(url: url)
        request.execute { (data) in
            guard let data = data else {
                return
            }
            guard let index = self.launches.firstIndex(where: {$0.id == launchId}) else {
                return
            }
            self.launches[index].patch = UIImage(data: data)
        }
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView(launches: TestData.sampleLaunches)
    }
}
