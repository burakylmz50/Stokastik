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
            Explore2()
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

struct Explore2: View {
    
    @StateObject var viewModel = ExploreViewModel()
    
    @State var currentIndex: Int = 0
    @State private var nextPageIndex: Int = 0
    
    var body: some View {
        ScrollView(.vertical) {
            Spacer(minLength: 20)
            
            MovieView(currentIndex: $currentIndex, title: "Now Playing", movieModel: viewModel.results)
                .onChange(of: currentIndex) { index in
                    Task {
                        if viewModel.shouldLoadData(id: index) {
                            nextPageIndex += 1
                            await viewModel.getTopRatedMovies(page: nextPageIndex)
                        }
                    }
                }
        }
        .scrollIndicators(.hidden)
        .toolbarBackground(.automatic, for: .navigationBar)
        .refreshable {
            viewModel.removeAllData()
            await viewModel.getTopRatedMovies(page: 1)
        }
        .onAppear {
            Task {
                await viewModel.getTopRatedMovies(page: 1)
            }
        }
    }
}
