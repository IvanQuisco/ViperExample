//
//  HomeServerModels.swift
//  viper
//
//  Created by Ivan Quintana on 08/08/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation


struct ItunesResponse: Codable {
    let resultCount: Int
    let results: [TrackResponse]
}

struct TrackResponse: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
}
