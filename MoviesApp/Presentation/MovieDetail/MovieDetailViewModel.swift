//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

import Foundation

@Observable
final class MovieDetailViewModel {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var formattedRating: String {
        String(format: "%.1f", movie.voteAverage)
    }
    
    var posterURL: URL? {
        guard let path = movie.posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
