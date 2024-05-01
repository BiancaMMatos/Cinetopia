//
//  MovieServices.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 20/04/24.
//

import Foundation

struct MovieServices {
    
    func getMovies(completion: @escaping(Result<[Movie], ErrorMovieServices>) -> Void) {
                
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            /// convertendo o data para o objeto Movie
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
                
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume() /// executando tarefa
        
    }
    
}

enum ErrorMovieServices: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
