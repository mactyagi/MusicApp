//
//  Model.swift
//  MusicApp
//
//  Created by Manu on 02/06/23.
//

//track name, artist name, description, price and artwork image.

import Foundation
// MARK: - Welcome
struct MusicModel: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let artistName: String?
    let collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String
    let shortDescription: String?
    let trackName, trackCensoredName: String?
    let trackViewURL: String?
    let artworkUrl30: String?
    let trackPrice: Double?

    enum CodingKeys: String, CodingKey {
        
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case shortDescription
        case artworkUrl60, artworkUrl100
        case trackName, trackCensoredName
        case trackViewURL = "trackViewUrl"
        case artworkUrl30, trackPrice
    }
}
