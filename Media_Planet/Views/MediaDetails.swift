//
//  MediaDetails.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI
import Kingfisher
import Combine

struct MediaDetails: View {
    var item: Results
    @State var pictures: [Logos] = []
    @State var item2: [Backdrops]
    
    let reloadSubject = PassthroughSubject<Void, Never>() // create a subject to emit reload events
    
    var body: some View {
        ScrollView(.vertical) {
            
            ZStack(alignment: .topLeading) {
                VStack {
                    let back = "https://image.tmdb.org/t/p/original/\(item2.randomElement()?.file_path ?? "")"

                    KFImage(URL(string: back))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxHeight: 20)
                            .blur(radius: 30)
                        
                   
                    
                   KFImage(URL(string: back))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 270)
                            .offset(y:-38)

                   
                    
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
                
                .onReceive(reloadSubject) { _ in // use the onReceive modifier to reload the data when the subject emits a new value
                    TMDB_API().getBackdrops(movie_id: String(item.id)) { (logo) in
                        self.item2 = logo
                    }
                }  .offset(y:250)
                
                
            }.accentColor(.accentColor)
                .toolbarBackground(.hidden)
            
        }
        .onAppear { // use the onAppear modifier to reload the data when the view appears for the first time
            TMDB_API().getBackdrops(movie_id: String(item.id)) { (logo) in
                self.item2 = logo
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            reloadSubject.send() // emit a reload event whenever the app enters foreground
        }
    }
}

//struct MediaDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaDetails(item: Re)
//    }
//}
