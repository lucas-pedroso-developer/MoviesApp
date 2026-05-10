//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

import Foundation

@Observable
final class MovieListViewModel {
    
    var movies: [Movie] = []
    var isLoading = false
    var errorMessage: String?
    
    private let useCase: FetchPopularMoviesUseCaseProtocol
    private var currentPage = 1
    
    init(useCase: FetchPopularMoviesUseCaseProtocol = FetchPopularMoviesUseCase(
        repository: MovieRepository()
    )) {
        self.useCase = useCase
    }
    
    func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let result = try await useCase.execute(page: currentPage)
            movies = result
        } catch {
            errorMessage = "Erro ao carregar filmes."
        }
        
        isLoading = false
    }
}
