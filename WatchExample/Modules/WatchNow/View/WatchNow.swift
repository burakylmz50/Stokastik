//
//  ContentView.swift
//  WatchExample
//
//  Created by Burak Yılmaz on 7.06.2023.
//

import SwiftUI

struct WatchNow: View {
    var title: String
    var body: some View {
        Text(title)
            .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchNow(title: "Burak")
    }
}
