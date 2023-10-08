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
    
    var title: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .popularMovies:
            return "Popular Movies"
        }
    }
}

struct MoviesExplore: View {
    
    @StateObject private var nowPlayingViewModel = ExploreViewModel(moviesExploreList: .nowPlaying)
    @StateObject private var popularMoviesViewModel = ExploreViewModel(moviesExploreList: .popularMovies)
    
    @State private var nowPlayingCurrentIndex: Int = 0
    @State private var popularMoviesCurrentIndex: Int = 0
    
    @State private var navigationPath: [MoviesExploreList] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath.animation(.easeOut)) {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    MovieView(
                        currentIndex: $nowPlayingCurrentIndex,
                        title: MoviesExploreList.nowPlaying.title,
                        movieModel: nowPlayingViewModel.results,
                        isLoading: nowPlayingViewModel.isLoading,
                        onTapGesture: {
                            navigationPath.append(.nowPlaying)
                        })
                    .onChange(of: nowPlayingCurrentIndex) { oldValue, newValue in
                        nowPlayingViewModel.shouldLoadData(
                            result: nowPlayingViewModel.results[safe: newValue]
                        )
                    }
                    .redacted(reason: nowPlayingViewModel.isLoading ? .placeholder : .init())
                    
                    Spacer()
                    
                    MovieView(
                        currentIndex: $popularMoviesCurrentIndex,
                        title: MoviesExploreList.popularMovies.title,
                        movieModel: popularMoviesViewModel.results,
                        isLoading: popularMoviesViewModel.isLoading,
                        onTapGesture: {
                            navigationPath.append(.popularMovies)
                        })
                    .onChange(of: popularMoviesCurrentIndex) { oldValue, newValue in
                        popularMoviesViewModel.shouldLoadData(
                            result: popularMoviesViewModel.results[safe: newValue]
                        )
                    }
                    .redacted(reason: nowPlayingViewModel.isLoading ? .placeholder : .init())
                }
            }
            .scrollIndicators(.hidden)
            .toolbarBackground(.automatic, for: .navigationBar)
        }
        .navigationDestination(for: MoviesExploreList.self) { path in
            switch path {
            case .nowPlaying:
                MovieListRow(
                    moviesExploreList: .nowPlaying,
                    movieModel: nowPlayingViewModel.results
                )
            case .popularMovies:
                MovieListRow(
                    moviesExploreList: .popularMovies, 
                    movieModel: popularMoviesViewModel.results
                )
            }
        }
    }
}

struct MoviesExplore_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
