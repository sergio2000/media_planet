//
//  ActorDetails.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/22/23.
//

import SwiftUI

struct ActorDetails: View {
    let id: Int
    @State var person = Actor(biography: "", profile_path: "", id: 0, name: "", birthday: "")
    var body: some View {
        VStack(alignment:.center) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(person.profile_path ?? "")")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 200)
                        .padding(.leading, 25)
                        
                    
                    
                    
                } placeholder: {
                    Color.gray
                        .frame(maxHeight: 200)
                        .padding(.leading, 25)
                }
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.headline)
                        .padding(.leading, 10)
                        .padding(.bottom, 5)
                    Text("Birthday")
                        .padding(.leading, 10)
                        .foregroundColor(.gray)
                    Divider()
                        .padding(.horizontal, 10)

                    HStack {
                        Text(person.birthday ?? "Not Found")
                            .padding(.leading, 10)
                        Image(systemName: "calendar")
                            .foregroundColor(.red)
                    }
                }
           Spacer()
                    
            }
            Spacer()
            
//            Text(person.biography)
//                .padding(.horizontal, 25)
            
        }
        .onAppear {
            TMDB_API().getActorInfo(actor_id: String(id)) { (actors) in
                self.person = actors
            }
        }
    }
}
//struct ActorDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ActorDetails(actor: "name", biography: "empty")
//    }
//}
