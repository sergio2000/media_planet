//
//  Results.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import Foundation

struct Results: Codable, Identifiable{
    let id: Int
    let original_title: String
    let popularity: Double
    let poster_path: String
    let backdrop_path: String?
    let overview: String
   
}
