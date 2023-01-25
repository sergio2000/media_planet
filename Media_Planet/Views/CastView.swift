//
//  CastView.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI

struct CastView: View {
    @State var people: [Cast] = []
    var id: String
    
    var body: some View {
       
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 2) {
                ForEach(people) { cast in
                    NavigationLink {
                        ActorDetails(id: cast.id )
                    } label: {
                        
                        VStack(alignment: .leading) {
                            Text(cast.name)
                                
                                .font(.headline)
                                .font(.system(size: 8))
                                .lineLimit(1)
                                .frame(width: 140, alignment: .leading)
                            
                            
                            Text(cast.character)
                                .font(.caption)
                                .frame(width: 140, alignment: .leading)
                                .lineLimit(1)
                                .truncationMode(.tail)
                            
                            
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(cast.profile_path ?? "")")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                                
                            }
                            .frame(width: 120, height: 180)
                            
                            .cornerRadius(8)
                            
                        }
                        .foregroundColor(.black)
                        .padding(2)
                        .cornerRadius(8)
                    }
                }
                
            }
        
            
        }.frame(height: 200)
        .onAppear{
            TMDB_API().getCast(movie_id: id){ (movie) in
                self.people = movie
           
            }
    }
    }
}

//struct CastView_Previews: PreviewProvider {
//    static var previews: some View {
//        CastView(id: "green")
//    }
//}
