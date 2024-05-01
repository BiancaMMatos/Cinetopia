//
//  MovieServices.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 20/04/24.
//

import Foundation

struct MovieServices {
    
    func getMovies(completion: @escaping([Movie]?) -> Void) {
        
        var movies: [Movie] = []
        
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil)
                return
            }
            
            /// convertendo o data para o objeto Movie
            do {
                movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(movies)
            } catch (let error) {
                print(error)
            }
        }
        
        task.resume() /// executando tarefa
        
    }
    
}
