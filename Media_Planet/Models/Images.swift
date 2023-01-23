//
//  Images.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import Foundation

struct Images: Codable, Identifiable {
    let id: Int
    let backdrops: [Backdrops]
    let logos: [Logos]
}
