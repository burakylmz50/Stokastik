//
//  MoviesExplore.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 14.09.2023.
//

import SwiftUI

enum MoviesExploreList {
    case nowPlaying
    case popularMovies
}

struct MoviesExplore: View {
    
    @StateObject var nowPlayingViewModel = ExploreViewModel(moviesExploreList: .nowPlaying)
    @StateObject var popularMoviesViewModel = ExploreViewModel(moviesExploreList: .popularMovies)
    
    @State var currentIndex: Int = 0
    @State private var nextPageIndex: Int = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                MovieView(currentIndex: $currentIndex, title: "Now Playing", movieModel: nowPlayingViewModel.results)
                    .onChange(of: currentIndex) { newValue in
                        nowPlayingViewModel.shouldLoadData(result: nowPlayingViewModel.results[safe: newValue])
                    }
                Spacer()
                
                MovieView(currentIndex: $currentIndex, title: "Popular Movies", movieModel: popularMoviesViewModel.results)
                    .onChange(of: currentIndex) { newValue in
                        popularMoviesViewModel.shouldLoadData(result: popularMoviesViewModel.results[safe: newValue])
                    }
            }
        }
        .scrollIndicators(.hidden)
        .toolbarBackground(.automatic, for: .navigationBar)
    }
}

struct MoviesExplore_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
