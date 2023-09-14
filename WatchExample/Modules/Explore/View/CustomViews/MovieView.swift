//
//  MovieView.swift
//  Stokastik
//
//  Created by Burak Yılmaz on 13.09.2023.
//

import SwiftUI

struct MovieView: View {
    @Binding var currentIndex: Int
    
    var title: String
    var movieModel: [TopRatedMoviesResponseResults]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .padding(.leading)
                .font(.bold(.title2)())
                .foregroundColor(.Tint.primary)
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(0..<movieModel.count, id: \.self) { item in
                        MovieCardView(movieCardViewModel: .init(
                            image: movieModel[item].posterPath ?? "",
                            title: movieModel[item].originalTitle ?? ""
                        ))
                        .frame(width: 200, height: 300)
                        .onChange(of: item) { newValue in
                            currentIndex = newValue
                        }
                        .onAppear {
                            currentIndex = item
                        }
                    }
                }
                .padding()
            }
        }
    }
}