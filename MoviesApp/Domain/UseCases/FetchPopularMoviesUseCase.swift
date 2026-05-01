//
//  FetchPopularMoviesUseCase.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 29/04/26.
//

final class FetchPopularMoviesUseCase: FetchPopularMoviesUseCaseProtocol {
    
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(page: Int) async throws -> [Movie] {
        try await repository.fetchPopularMovies(page: page)
    }
}
