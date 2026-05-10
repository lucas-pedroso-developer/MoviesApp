//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieListView: View {
    
    @State private var viewModel = MovieListViewModel()
    let coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: Binding(
            get: { coordinator.path },
            set: { coordinator.path = $0 }
        )) {
            content
                .navigationTitle("Filmes Populares")
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .movieDetail(let movie):
                        MovieDetailView(movie: movie, coordinator: coordinator)
                    }
                }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let error = viewModel.errorMessage {
            Text(error)
                .foregroundStyle(.red)
        } else {
            movieList
        }
    }
    
    private var movieList: some View {
        List(viewModel.movies) { movie in
            MovieRowView(movie: movie)
                .onTapGesture {
                    coordinator.push(.movieDetail(movie))
                }
        }
        .listStyle(.plain)
    }
}

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 12) {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(movie.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 90)
                    .clipped()
                    .cornerRadius(8)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 90)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.releaseDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(String(format: "⭐ %.1f", movie.voteAverage))
                    .font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}
