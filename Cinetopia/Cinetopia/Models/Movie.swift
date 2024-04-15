//
//  Movie.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 14/04/24.
//

import Foundation


struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}


// Mocked movies
let movies: [Movie] = [
    Movie(id: 1, title: "Avatar", image: "Avatar", synopsis: "É um filme sobre um cara azul num mundo com nome de jóia", rate: 9.4, releaseDate: "18/12/2022"),
    Movie(id: 2, title: "Vingadores Ultimato", image: "Vingadores", synopsis: "Heróis lutando pra pegar uma luva.", rate: 9.2, releaseDate: "25/04/2019"),
    Movie(id: 3, title: "Harry Potter - 1", image: "HP", synopsis: "Criança bruxa e com um raio na cabeça", rate: 9.5, releaseDate: "15/07/2021")
]
