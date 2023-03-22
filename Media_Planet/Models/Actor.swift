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
    let combined_credits: CombinedCredits?
    
    init(biography: String, profile_path: String?, id: Int, name: String, birthday: String?, combined_credits: CombinedCredits?) {
        self.biography = biography
        self.profile_path = profile_path
        self.name = name
        self.id = id
        self.birthday = birthday
        self.combined_credits = combined_credits
    }
}

struct CombinedCredits: Codable {
    let cast: [Credit]?
    let crew: [Credit]?
}

struct Credit: Codable, Identifiable {
    let id: Int
    let original_title: String?
    let title: String?
    let popularity: Double
    let poster_path: String?
    let backdrop_path: String?
    let overview: String?
}

