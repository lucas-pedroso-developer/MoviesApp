//
//  MockFetchPopularMoviesUseCase.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

@testable import MoviesApp

final class MockFetchPopularMoviesUseCase: FetchPopularMoviesUseCaseProtocol {
    
    var result: Result<[Movie], Error> = .success([])
    var executeCallCount = 0
    
    func execute(page: Int) async throws -> [Movie] {
        executeCallCount += 1
        return try result.get()
    }
}
