//
//  ApiServiceImpl.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import Foundation

class ApiServiceImpl: ApiService {

    func getPopularMovies() async throws -> [MovieDTO] {
        return try await fetchMovies(from: "/movie/popular")
    }

    func getTopRatedMovies() async throws -> [MovieDTO] {
        return try await fetchMovies(from: "/movie/top_rated")
    }

    func getUpcomingMovies() async throws -> [MovieDTO] {
        return try await fetchMovies(from: "/movie/upcoming")
    }
    
    func getSimilarMovies(movieId: Int) async throws -> [MovieDTO] {
        let url = "\(Constants.baseURL)/movie/\(movieId)/similar?api_key=\(Constants.apiKey)&language=es&page=1"
        guard let urlRequest = URL(string: url) else {
            print("Error: Invalid URL")
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            print("Error: Server returned an error")
            throw URLError(.badServerResponse)
        }

        do {
            let decoded = try JSONDecoder().decode(ResultDTO.self, from: data)
            return decoded.results ?? []
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
    
    func getActorsByIdMovie(id: Int) async throws -> [ActorDTO] {
        let url = "\(Constants.baseURL)/movie/\(id)/credits?api_key=\(Constants.apiKey)&language=es"
        
        guard let urlRequest = URL(string: url) else {
            print("Error: Invalid URL")
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            print("Error: Server returned an error")
            throw URLError(.badServerResponse)
        }
        
        do {
            let actorsList = try JSONDecoder().decode(CastDTO.self, from: data)
            return actorsList.cast
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
    
    func getMovieByName(name: String) async throws -> [MovieDTO] {
        guard let url = buildURL(for: "/search/movie") else {
            throw URLError(.badURL)
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems?.append(URLQueryItem(name: "query", value: name))
        
        guard let finalURL = components?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: finalURL)
        let decoded = try JSONDecoder().decode(ResultDTO.self, from: data)
        return decoded.results ?? []
    }
    
    private func fetchMovies(from path: String) async throws -> [MovieDTO] {
        guard let url = buildURL(for: path) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(ResultDTO.self, from: data)
        return decoded.results ?? []
    }
    
    private func buildURL(for path: String) -> URL? {
        var components = URLComponents(string: Constants.baseURL + path)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.apiKey),
            URLQueryItem(name: "language", value: "es")
        ]
        return components?.url
    }
    
    func getMovieDetail(movieId: Int) async throws -> MovieDetailDTO {
        guard let url = buildURL(for: "/movie/\(movieId)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(MovieDetailDTO.self, from: data)
        return decoded
    }
}
