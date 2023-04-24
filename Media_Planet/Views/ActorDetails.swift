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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                        )
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
            }.padding(.horizontal, 25)
                .padding(.vertical, 10)
            
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
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 4) {
                        ForEach(person.combined_credits?.cast ?? []) { (person: Credit) in
                            
                                KFImage(URL(string: "https://image.tmdb.org/t/p/original/\(person.poster_path ?? "")"))
                                
                                    .placeholder {
                                        ZStack {
                                            Color.gray
                                            
                                                .frame(width: UIScreen.main.bounds.width / 3 - 20, height: UIScreen.main.bounds.width / 2 - 20)
                                                .cornerRadius(8)
                                            Text(person.original_title ?? "")
                                                .multilineTextAlignment(.center)
                                                .padding(8)
                                        }
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 200)
                                    .cornerRadius(8)
                            }
                        
                    }.padding()
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
