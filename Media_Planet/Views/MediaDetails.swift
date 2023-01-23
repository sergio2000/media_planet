//
//  MediaDetails.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI

struct MediaDetails: View {
    var item: Results
    @State var pictures: [Logos] = []
    var body: some View {
        ScrollView(.vertical) {
            
            ZStack(alignment: .topLeading) {
                VStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(item.backdrop_path ?? "")")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 20)
                            .blur(radius: 30)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(item.backdrop_path ?? "")")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 270)
                            .offset(y:-38)

                    } placeholder: {
                       ProgressView()
                    }
                    
                }
                VStack{
                    
                    
                    
//                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(pictures.first?.file_path ?? "")")) { image in
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding(.horizontal, 100)
//
//
//
//
//                    } placeholder: {
//
//                    }
                    VStack(alignment: .leading) {
                        Text(item.original_title)
                            .font(.title)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Description")
                            .font(.headline)
                        Divider()
                        Text(item.overview)
                            .font(.subheadline)
                    
                        
                        
                   
                    CastView(id: String(item.id))
                        .frame(height: 240)
                   Spacer(minLength: 200)
                    }   .padding(.horizontal, 25)
                }
                
                    .onAppear {
                        TMDB_API().getLogos(movie_id: String(item.id)) { (logo) in
                            self.pictures = logo
                        }
                    }  .offset(y:250)
                
                
            }.accentColor(.accentColor)
                .toolbarBackground(.hidden)
            
        }
    }
}
//struct MediaDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaDetails(item: Re)
//    }
//}
