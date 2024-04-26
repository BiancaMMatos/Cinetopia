//
//  MovieServices.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 20/04/24.
//

import Foundation

struct MovieServices {
    
    func getMovies() -> [Movie]? {
        
        var movies: [Movie] = []
        
        let urlString = "http://localhost:3000/movies" /// constante para armazenar a URL
        guard let url = URL(string: urlString) else { return nil }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            /// convertendo o data para o objeto Movie
            do {
                movies = try JSONDecoder().decode([Movie].self, from: data)
                
            } catch (let error) {
                print(error)
            }
        }
        
        task.resume() /// executando tarefa
        
        return movies
    }
    
}
