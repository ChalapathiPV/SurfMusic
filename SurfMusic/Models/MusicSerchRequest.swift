//
//  MusicSerchRequest.swift
//  SurfMusic
//
//  Created by PVC on 09/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

struct MusicSearchRequest {

    // MARK: - Properties

    let baseUrl: String

    // MARK: -

    let artist: String
    let album: String

    // MARK: -

    var url: URL? {
        
        var urlComponents = URLComponents(string:baseUrl)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: MusicSearchService.METHOD, value: MusicSearchService.ARTIST_SEARCH),
            URLQueryItem(name: MusicSearchService.ARTIST, value: artist),
            URLQueryItem(name: MusicSearchService.API_KEY, value: MusicSearchService.API_KEY_VALUE),
            URLQueryItem(name: MusicSearchService.FORMAT, value: MusicSearchService.JSON)
        ]
        return urlComponents.url
    }

}
