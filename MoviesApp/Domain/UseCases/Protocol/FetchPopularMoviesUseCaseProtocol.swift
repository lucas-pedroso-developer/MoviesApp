//
//  FetchPopularMoviesUseCaseProtocol.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 29/04/26.
//

protocol FetchPopularMoviesUseCaseProtocol {
    func execute(page: Int) async throws -> [Movie]
}
