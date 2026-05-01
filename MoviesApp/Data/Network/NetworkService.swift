//
//  NetworkService.swift
//  MoviesApp
//
//  Created by Lucas Pedroso on 01/05/26.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    func request<T: Decodable>(_ endpoint: MovieEndpoint) async throws -> T {
        var components = URLComponents(string: Config.baseURL + endpoint.path)
        components?.queryItems = endpoint.queryItems
        
        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(Config.bearerToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decoding(error)
        }
    }
}
