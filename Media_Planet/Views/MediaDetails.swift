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
    @State var item2: [Backdrops]

    
    var body: some View {
        ScrollView(.vertical) {
            
            ZStack(alignment: .topLeading) {
                VStack {
                    let back = "https://image.tmdb.org/t/p/original/\(item2.randomElement()?.file_path ?? "")"
                    AsyncImage(url: URL(string: back)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 20)
                            .blur(radius: 30)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    AsyncImage(url: URL(string: back)) { image in
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
                        Text(item.title)
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 25)
                        Spacer()
                        Text("Description")
                            .font(.headline)
                            .padding(.horizontal, 25)
                        Divider()
                        Text(item.overview)
                            .font(.subheadline)
                            .padding(.horizontal, 25)
                        
                        
                   
                    CastView(id: String(item.id))
                        .frame(height: 240)
                        .padding(.leading, 25)
                   Spacer(minLength: 200)
                    }
                }
                
                    .onAppear {
                        TMDB_API().getBackdrops(movie_id: String(item.id)) { (logo) in
                            self.item2 = logo
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
