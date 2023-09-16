//
//  MoviesExplore.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 14.09.2023.
//

import SwiftUI

struct MoviesExplore: View {
    
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
                            await viewModel.getNowPlayingMovies(page: nextPageIndex)
                        }
                    }
                }
            
            Spacer()
            
            MovieView(currentIndex: $currentIndex, title: "Now Playing", movieModel: viewModel.results)
                .onChange(of: currentIndex) { index in
                    Task {
                        if viewModel.shouldLoadData(id: index) {
                            nextPageIndex += 1
                            await viewModel.getNowPlayingMovies(page: nextPageIndex)
                        }
                    }
                }
        }
        .scrollIndicators(.hidden)
        .toolbarBackground(.automatic, for: .navigationBar)
        .refreshable {
            viewModel.removeAllData()
            await viewModel.getNowPlayingMovies(page: 1)
        }
        .onAppear {
            Task {
                await viewModel.getNowPlayingMovies(page: 1)
            }
        }
    }
}

struct MoviesExplore_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
