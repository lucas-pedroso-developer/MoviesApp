//
//  MovieResponseDTO.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 01/05/26.
//

import Foundation

struct MovieResponseDTO: Decodable {
    let results: [MovieDTO]
}

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
    // Converte DTO → Domain Model aqui, no limite entre as camadas
    func toDomain() -> Movie {
        Movie(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage
        )
    }
}
