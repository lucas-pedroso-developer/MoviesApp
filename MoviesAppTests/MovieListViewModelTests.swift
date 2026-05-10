//
//  MovieListViewModelTests.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

import Testing
@testable import MoviesApp

@MainActor
struct MovieListViewModelTests {
    
    // MARK: - Helpers
    
    private func makeMovies() -> [Movie] {
        [
            Movie(id: 1, title: "Batman", overview: "Um herói", posterPath: nil, releaseDate: "2022-01-01", voteAverage: 8.0),
            Movie(id: 2, title: "Superman", overview: "Outro herói", posterPath: nil, releaseDate: "2023-01-01", voteAverage: 7.5)
        ]
    }
    
    // MARK: - Tests
    
    @Test func fetchMovies_success_populatesMovies() async {
        // Arrange
        let mock = MockFetchPopularMoviesUseCase()
        mock.result = .success(makeMovies())
        let viewModel = MovieListViewModel(useCase: mock)
        
        // Act
        await viewModel.fetchMovies()
        
        // Assert
        #expect(viewModel.movies.count == 2)
        #expect(viewModel.movies[0].title == "Batman")
        #expect(viewModel.errorMessage == nil)
        #expect(mock.executeCallCount == 1)
    }
    
    @Test func fetchMovies_failure_setsErrorMessage() async {
        // Arrange
        let mock = MockFetchPopularMoviesUseCase()
        mock.result = .failure(NetworkError.invalidResponse)
        let viewModel = MovieListViewModel(useCase: mock)
        
        // Act
        await viewModel.fetchMovies()
        
        // Assert
        #expect(viewModel.movies.isEmpty)
        #expect(viewModel.errorMessage == "Erro ao carregar filmes.")
    }
    
    @Test func fetchMovies_hidesLoadingAfterCompletion() async {
        // Arrange
        let mock = MockFetchPopularMoviesUseCase()
        mock.result = .success(makeMovies())
        let viewModel = MovieListViewModel(useCase: mock)
        
        // Act
        await viewModel.fetchMovies()
        
        // Assert
        #expect(viewModel.isLoading == false)
    }
}
