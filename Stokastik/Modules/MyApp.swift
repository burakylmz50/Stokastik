//
//  WatchExampleApp.swift
//  WatchExample
//
//  Created by Burak Yılmaz on 7.06.2023.
//

import SwiftUI

@main
struct ContentView: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                WatchNow()
                    .tabItem {
                        Label("WatchNow", systemImage: "play.circle")
                    }
                Explore()
                    .tabItem {
                        Label("Explore", systemImage: "safari")
                    }
                    .toolbarBackground(Color.red, for: .tabBar)
            }
            .toolbar(.visible, for: .bottomBar)
            .toolbarBackground(.red, for: .tabBar)
            
            //            .onAppear() {
            //                UITabBar.appearance().backgroundColor = .lightGray
            //            }
        }
    }
}
