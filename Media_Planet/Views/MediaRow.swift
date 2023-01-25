//
//  MediaRow.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI

struct MediaRow: View {
    
    @State var movies: [Results] = []
    @State var item2: [Backdrops] = []
    
    var path: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(path.replacingOccurrences(of: "_", with: " "))
                .font(.headline)
                .padding(.leading, 15)
            
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(movies) { movies in
                        NavigationLink {
                            MediaDetails(item: movies, item2: item2)
                        } label: {
                            MediaItem(movies: movies)                    }
                        
                    }
                }
            }
            
            
        }  .onAppear {
            TMDB_API().getMovies(endpoint: path.lowercased()){ (movie) in
                self.movies = movie
            }
            
            
        }
    }
}
//    struct MediaRow_Previews: PreviewProvider {
//        static var previews: some View {
//            MediaRow(path: "upcoming")
//        }
//    }
//}
