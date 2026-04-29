//
//  MovieRepositoryProtocol.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 29/04/26.
//

protocol MovieRepositoryProtocol {
    func fetchPopularMovies(page: Int) async throws -> [Movie]
}
