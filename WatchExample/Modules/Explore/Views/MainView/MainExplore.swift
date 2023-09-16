//
//  Explore.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 7.06.2023.
//

import SwiftUI

enum Segment: String, CaseIterable {
    case movies = "Movies"
    case series = "Series"
}

struct MainExplore: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = Color.convert(.Brand.primary)
    }
    
    @State var selectedSegment: Segment = .movies
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Picker("", selection: $selectedSegment) {
                        ForEach(Segment.allCases, id: \.self) {
                            Text($0.rawValue)
                               
                                
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    Spacer()
                    MainExploreSegments(selectedSegment: selectedSegment)
                    Spacer()
                }
                .navigationTitle("Explore")
            }
        }
    }
}


struct MainExploreSegments: View {
    
    var selectedSegment: Segment
    
    var body: some View {
        switch selectedSegment {
        case .movies:
            MoviesExplore()
        case .series:
            WatchNow()
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
