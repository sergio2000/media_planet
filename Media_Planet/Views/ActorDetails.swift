//
//  ActorDetails.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/22/23.
//

import SwiftUI
import Kingfisher

struct ActorDetails: View {
    let id: Int
    @State var person = Actor(biography: "", profile_path: "", id: 0, name: "", birthday: "", combined_credits: nil)
    @State var selectedOption = 0
    @State var failedIndex: Int? = nil
    var body: some View {
        VStack(alignment:.center) {
            HStack(alignment: .top) {
                KFImage(URL(string: "https://image.tmdb.org/t/p/original/\(person.profile_path ?? "")"))
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .padding(10)
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
            }
            
            Picker(selection: $selectedOption, label: Text("Information")) {
                Text("Biography").tag(0)
                Text("Popularity").tag(1)
                Text("Movies").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 25)
            
            switch selectedOption {
            case 0:
                ScrollView {
                    Text(person.biography)
                        .padding(.horizontal, 25)
                }
            case 1:
                Text(person.birthday ?? "")
                    .padding(.horizontal, 25)
            case 2:
                ScrollView(.vertical) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(person.combined_credits?.cast ?? []) { (person: Credit) in
                            KFImage(URL(string: "https://image.tmdb.org/t/p/original/\(person.poster_path ?? "")"))
                                
                                .placeholder { ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color(.black))) }
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 200)
                                    .padding(.leading, 25)
                            
                           
                        }
                    }.padding(.trailing, 10)
                }

            default:
                Text("Invalid option")
            }
            
            Spacer()
            
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
