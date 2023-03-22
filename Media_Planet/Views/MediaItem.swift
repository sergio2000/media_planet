//
//  MediaItem.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI
import Kingfisher
struct MediaItem: View {
    var movies: Results
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: "https://image.tmdb.org/t/p/original/\(movies.poster_path)"))
                    .placeholder { Image("placeholder-image") }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 200)
                    .cornerRadius(8)
                    
          
                
            
            
//                Text(movies.original_title)
//                                .font(.caption)
//                                .multilineTextAlignment(.center)
//                                .frame(width: 120,height: 40,  alignment: .top)
             
        }.padding(.leading, 15)
    }
}

//struct MediaItem_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaItem(movies: Results.)
//    }
//}
