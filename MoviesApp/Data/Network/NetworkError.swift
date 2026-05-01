//
//  NetworkError.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 01/05/26.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decoding(Error)
    case unknown(Error)
}
