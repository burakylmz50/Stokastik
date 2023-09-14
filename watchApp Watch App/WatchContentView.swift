//
//  ContentView.swift
//  watchApp Watch App
//
//  Created by Burak Yılmaz on 7.06.2023.
//

import SwiftUI

struct WatchContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchContentView()
    }
}
