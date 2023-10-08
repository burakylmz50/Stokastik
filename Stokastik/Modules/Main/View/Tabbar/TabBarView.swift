//
//  TabBarView.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 31.07.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().backgroundColor = Color.convert(.Background.secondary)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Color.convert(.Tint.primary)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Color.convert(.Tint.primary)]
    }
    
    var body: some View {
        TabView(selection: $selection) {
            WatchNow(title: "Tabbar")
                .tabItem {
                    Label("WatchNow", systemImage: "play.circle")
                }
                .tag(0)
            MainExplore()
                .tabItem {
                    Label("Explore", systemImage: "safari")
                }
                .tag(1)
        }
        .accentColor(.Brand.primary)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
