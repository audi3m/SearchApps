//
//  SearchResponse.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import Foundation

struct SearchResponse: Decodable, Sequence {
    let results: [Appp]
    
    func makeIterator() -> Array<Appp>.Iterator {
        return results.makeIterator()
    }
}

struct Appp: Decodable {
    let screenshotUrls: [String]
    let icon60: String
    let icon100: String
    let corpName: String
    let description: String
    let genres: [String]
    let price: Double?
    let appTitle: String
    let appID: Int
    let version: String
    let averageUserRatingForCurrentVersion: Double
    let currentVersionReleaseDate: String
    let releaseNotes: String?
    
    enum CodingKeys: String, CodingKey {
        case screenshotUrls
        case icon60 = "artworkUrl60"
        case icon100 = "artworkUrl100"
        case corpName = "artistName"
        case description
        case genres
        case price
        case appTitle = "trackName"
        case appID = "trackId"
        case version
        case averageUserRatingForCurrentVersion
        case currentVersionReleaseDate
        case releaseNotes
    }
    
    var rating: String {
        String(format: "%.1f", averageUserRatingForCurrentVersion)
    }
    
    func threeURLs() -> [URL?] {
        return screenshotUrls.prefix(3).map { URL(string: $0) }
    }
    
    func allURLs() -> [URL?] {
        return screenshotUrls.map { URL(string: $0) }
    }
    
}

