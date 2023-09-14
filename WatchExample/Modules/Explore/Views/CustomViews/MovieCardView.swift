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
        
    private var movieCardViewModel: MovieCardViewModel
    
    init(movieCardViewModel: MovieCardViewModel) {
        self.movieCardViewModel = movieCardViewModel
    }
    
    var body: some View {
        VStack {
            ZStack {
                CacheAsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/" + movieCardViewModel.image)!) { phase in
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
                .frame(width: 200, height: 300)
                .background(.gray)
                .cornerRadius(10)
                
                MovieTitleView(title: movieCardViewModel.title)
                    .hiddenModifier(isHide: movieCardViewModel.image != "")
            }
        }
    }
    
    struct MovieView_Previews: PreviewProvider {
        static var previews: some View {
            MainExplore()
        }
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

struct HiddenModifier: ViewModifier{
    var isHide: Bool
    
    func body(content: Content) -> some View {
        if isHide {
            content
                .hidden()
        }
        else{
            content
        }
    }
}

extension View{
    func hiddenModifier(isHide: Bool) -> some View{
        return self.modifier(HiddenModifier(isHide: isHide))
    }
}
