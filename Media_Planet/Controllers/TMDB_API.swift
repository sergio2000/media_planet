//
//  TMDB_API.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/17/23.
//

import Foundation

//retrives first page of movies based on different endpoints
class TMDB_API: ObservableObject {
    func getMovies(endpoint: String, completion: @escaping ([Results]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(endpoint)?api_key=be3c28f238dc17af4f5b058fd44ffae2&language=en-US&page=1")
                
        else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Media.self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(posts.results)
            }
        }
        .resume()
    }
    func getCast(movie_id: String, completion: @escaping ([Cast]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie_id)/credits?api_key=be3c28f238dc17af4f5b058fd44ffae2&language=en-US")
        
        else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let people = try! JSONDecoder().decode(People.self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(people.cast)
            }
        }
        .resume()
    }
    
    //retrives the different 
    func getBackdrops(movie_id: String, completion: @escaping ([Cast]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie_id)/credits?api_key=be3c28f238dc17af4f5b058fd44ffae2&language=en-US")
        
        else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let people = try! JSONDecoder().decode(People.self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(people.cast)
            }
            
        }
        .resume()
    }
    
    func getLogos(movie_id: String, completion: @escaping ([Logos]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie_id)/images?api_key=be3c28f238dc17af4f5b058fd44ffae2&include_image_language=en")
        
        else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let pictures = try! JSONDecoder().decode(Images.self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(pictures.logos)
            }
        }
        .resume()
    }

}