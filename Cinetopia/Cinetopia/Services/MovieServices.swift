//
//  MovieServices.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 20/04/24.
//

import Foundation
import Alamofire

struct MovieServices {
    
    static let sharedInstance = MovieServices()
    
//    func getMovies() async throws -> [Movie] {
//                
//        let urlString = "http://localhost:3000/movies"
//        guard let url = URL(string: urlString) else { throw ErrorMovieServices.invalidURL }
//        
//        let (data, response) = try await URLSession.shared.data(from: url) /// é assíncrono
//        
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw ErrorMovieServices.invalidResponse
//        }
//        
//        do {
//            let movies = try JSONDecoder().decode([Movie].self, from: data) /// não é assíncrono
//            return movies
//            
//        } catch {
//            throw ErrorMovieServices.decodingError
//        }
//        
//    }
    
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString: String = "http://localhost:3000/movies"
        guard let url = URL(string: urlString) else {
            completion(.failure(ErrorMovieServices.invalidURL))
            return
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                switch response.result {
                case .success(let data):
                    do {
                        guard let data = data else {
                            completion(.failure(ErrorMovieServices.invalidData))
                            return
                        }
                        let movies = try JSONDecoder().decode([Movie].self, from: data)
                        completion(.success(movies))
                    } catch {
                        completion(.failure(ErrorMovieServices.decodingError))
                    }
                case .failure(_):
                    completion(.failure(ErrorMovieServices.invalidResponse))
                }
            }
    }
    
}

enum ErrorMovieServices: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case invalidData
}
