//
//  ExploreViewModel.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 18.06.2023.
//

import Foundation

@MainActor class ExploreViewModel: ObservableObject {
    
    @Published private(set) var results: [TopRatedMoviesResponseResults] =  [TopRatedMoviesResponseResults]()
    @Published private(set) var error: Error?
    @Published private(set) var isLoading = false
    
    private let moviesService = ExploreService()
    
    func getNowPlayingMovies(page: Int) async {
        defer {
            isLoading = false
        }
        Task(priority: .background) {
            
            do {
                let results =  try await moviesService.getNowPlayingMovies(page: page).results ?? []
                self.results = self.results + results
            } catch let error {
                self.error = error
            }
        }
    }
    
    func removeAllData() {
        results.removeAll()
    }
    
    func shouldLoadData(id: Int) -> Bool {
        id == results.count - 2
    }
}

