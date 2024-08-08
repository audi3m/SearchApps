//
//  Response.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import Foundation

struct SearchResponse: Decodable {
    let results: [Appp]
}

struct Appp: Decodable {
    let screenshotUrls: [String]
    let artworkUrl60: String
    let artistName: String
    let description: String
    let genres: [String]
    let price: Double
    let trackName: String
    let trackId: Int
    
    let currentVersionReleaseDate: String
    let releaseNotes: String
    
    
    
}

