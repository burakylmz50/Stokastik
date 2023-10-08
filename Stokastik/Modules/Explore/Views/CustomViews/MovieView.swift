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
    var isLoading: Bool
    
    var onTapGesture: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .padding(.leading)
                    .font(.bold(.title2)())
                    .foregroundColor(.Tint.primary)
                
                Button("See All") {
                    onTapGesture()
                }
                .padding(.trailing)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(0..<movieModel.count, id: \.self) { item in
                        MovieCardView(topRatedMoviesResponseResults: movieModel[item])
                            .onAppear {
                                currentIndex = item
                            }
                    }
                }
                .frame(width: .infinity, height: 300)
                .padding()
            }
        }
        .redacted(reason: isLoading ? .placeholder : .init())
    }
}
struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MainExplore()
    }
}
