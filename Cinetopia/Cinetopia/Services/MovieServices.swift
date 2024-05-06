//
//  MovieServices.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 20/04/24.
//

import Foundation

struct MovieServices {
    
    func getMovies() async throws -> [Movie] {
                
        let urlString = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else { throw ErrorMovieServices.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url) /// é assíncrono
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ErrorMovieServices.invalidResponse
        }
        
        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data) /// não é assíncrono
            return movies
            
        } catch {
            throw ErrorMovieServices.decodingError
        }
        
    }
    
}

enum ErrorMovieServices: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
