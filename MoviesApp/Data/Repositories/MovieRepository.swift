//
//  MovieRepository.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 01/05/26.
//

final class MovieRepository: MovieRepositoryProtocol {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = .shared) {
        self.networkService = networkService
    }
    
    func fetchPopularMovies(page: Int) async throws -> [Movie] {
        let response: MovieResponseDTO = try await networkService.request(.popularMovies(page: page))
        return response.results.map { $0.toDomain() }
    }
}
