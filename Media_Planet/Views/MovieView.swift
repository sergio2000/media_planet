//
//  MovieView.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 4/23/23.
//

import SwiftUI

struct MovieView: View {

    var paths = ["Top_Rated", "Upcoming", "Popular", "Now_Playing"]

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(paths, id: \.self){ path in
                        MediaRow(path: path)
                    }
                }
            }
        }.navigationTitle("Movies")
    } 
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
