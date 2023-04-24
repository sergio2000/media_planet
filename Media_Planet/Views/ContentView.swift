//
//  ContentView.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            MovieView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            TVView()
                .tabItem {
                    Label("TV Shows", systemImage: "sparkles.tv")
                }
            SearchView()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "magnifyingglass")
                }
        }
            

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
