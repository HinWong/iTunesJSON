//
//  Music.swift
//  GMCodingChallenge
//
//  Created by Hin Wong on 6/4/21.
//

import Foundation

// MARK: - Welcome
struct MusicResponse: Decodable {
    let resultCount: Int
    let results: [Music]
}

// MARK: - Result

struct Music: Decodable {
    let artistName: String
    let trackName: String?
    let releaseDate: String
    let trackPrice: Double?
    let primaryGenreName: String
    let artworkUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, trackName, releaseDate, trackPrice, primaryGenreName
        case artworkUrl = "artworkUrl100"
    }
}
