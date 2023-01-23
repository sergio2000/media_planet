//
//  ContentView.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
