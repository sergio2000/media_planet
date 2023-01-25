//
//  Actor.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/23/23.
//

import Foundation

struct Actor: Codable, Identifiable {
    let biography: String
    let profile_path: String?
    let birthday: String?
    let name: String
    let id: Int
    
    init(biography: String,profile_path: String, id: Int, name: String, birthday: String) {
        self.biography = biography
        self.profile_path = profile_path
        self.name = name
        self.id = id
        self.birthday = birthday
        
    }
}
