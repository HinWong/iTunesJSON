//
//  NetworkManagerViewModel.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/4/21.
//

import Foundation

//https://itunes.apple.com/search?term={any ArtistName}


class NetworkManager {
    
    static let baseURL = URL(string: "https://itunes.apple.com/search")
    static let urlQuerySearchName = "term"
    
    static func fetchMusic(searchTerm: String, completion: @escaping (Result<MusicResponse, MusicError>) -> Void) {
        
        // 1. build url
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [URLQueryItem(name: urlQuerySearchName, value: searchTerm)]
        guard let finalURL = urlComponents?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        // 2. data task
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            
            // 3. error handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            // 4. check for data
            guard let data = data else {return completion(.failure(.noData))}
            
            // 5. decode Data
            do {
                let decodeData = try JSONDecoder().decode(MusicResponse.self, from: data)
                //print(decodeData)
                completion(.success(decodeData))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
    }
}
