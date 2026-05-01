//
//  MovieEndpoint.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 01/05/26.
//

import Foundation

enum MovieEndpoint {
    case popularMovies(page: Int)
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/movie/popular"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .popularMovies(let page):
            return [
                URLQueryItem(name: "language", value: "pt-BR"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
    }
}
