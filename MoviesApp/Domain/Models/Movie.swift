//
//  Movie.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 29/04/26.
//

struct Movie: Identifiable, Equatable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
}
