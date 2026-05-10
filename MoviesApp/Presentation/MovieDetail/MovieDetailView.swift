//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 10/05/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
    
    @State private var viewModel: MovieDetailViewModel
    let coordinator: AppCoordinator
    
    init(movie: Movie, coordinator: AppCoordinator) {
        self._viewModel = State(initialValue: MovieDetailViewModel(movie: movie))
        self.coordinator = coordinator
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                WebImage(url: viewModel.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .aspectRatio(2/3, contentMode: .fit)
                        .cornerRadius(12)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.movie.title)
                        .font(.title2)
                        .bold()
                    
                    Text("⭐ \(viewModel.formattedRating)  •  \(viewModel.movie.releaseDate)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(viewModel.movie.overview)
                        .font(.body)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
