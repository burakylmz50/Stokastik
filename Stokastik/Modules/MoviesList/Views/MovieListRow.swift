//
//  MoviesList.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 4.10.2023.
//

import SwiftUI

struct MovieListRow: View {
    
    @State private var movieModel: [TopRatedMoviesResponseResults]
    
    private var moviesExploreList: MoviesExploreList?
    
    init(moviesExploreList: MoviesExploreList, movieModel: [TopRatedMoviesResponseResults]) {
        self.moviesExploreList = moviesExploreList
        self.movieModel = movieModel
    }
    
    var body: some View {
        List(movieModel, id: \.id) { topRatedMovie in
                HStack {
                    CacheAsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + (topRatedMovie.posterPath ?? ""))!) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        case .failure(_):
                            EmptyView()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    Text("asdasdas")
                }
                .padding([.leading, .top, .bottom])
                .frame(height: 140)
                .background(.red)
                .listRowSeparator(.hidden)
                .cornerRadius(10)
        }
        .listRowSpacing(10)
        .background(Color.Background.primary)
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        .navigationBarTitleDisplayMode(.automatic)
        .navigationTitle(moviesExploreList?.title ?? "")
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
