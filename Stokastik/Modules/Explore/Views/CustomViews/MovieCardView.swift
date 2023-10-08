//
//  MovieCardView.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 20.06.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardViewModel  {
    var image: String
    var title: String
}

struct MovieCardView: View {
    
    private var topRatedMoviesResponseResults: TopRatedMoviesResponseResults
    
    init(topRatedMoviesResponseResults: TopRatedMoviesResponseResults) {
        self.topRatedMoviesResponseResults = topRatedMoviesResponseResults
    }
    
    var body: some View {
        VStack {
            ZStack {
                MovieTitleView(title: topRatedMoviesResponseResults.originalTitle ?? "")
                
                NavigationLink(destination: WatchNow(title: topRatedMoviesResponseResults.originalTitle ?? "")) {
                    CacheAsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + (topRatedMoviesResponseResults.posterPath ?? ""))!) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        default:
                            EmptyView()
                        }
                    }
                }
            }
            .frame(width: 200, height: 300)
            .background(.gray)
            .cornerRadius(10)
        }
    }
    
    struct MovieTitleView: View {
        var title: String
        
        var body: some View {
            Text(title)
                .font(.largeTitle)
                .frame(alignment: .center)
                .multilineTextAlignment(.center)
                .foregroundColor(.Tint.secondary)
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
