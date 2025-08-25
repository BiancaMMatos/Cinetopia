//
//  MovieServices.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 20/04/24.
//

import Foundation
import Alamofire

struct MovieServices {
    
    func fetchMovies() async throws -> [Movie] {
        var allMovies: [Movie] = [Movie]()
        guard let url = URL(string: "http://localhost:3000/movies") else { throw ErrorMovieServices.invalidURL }

        let apiRequest = await withCheckedContinuation { continuation in
            AF.request(url, method: .get).validate().responseData { apiRequest in
                continuation.resume(returning: apiRequest)
            }
        }
        
        guard let data = apiRequest.data else { throw ErrorMovieServices.invalidData }

        do {
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            allMovies = movies
            
        } catch {
            throw ErrorMovieServices.decodingError
        }

        return allMovies
    }
    
}

enum ErrorMovieServices: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case invalidData
}
