//
//  MusicSearchResponseExtensions.swift
//  SurfMusic
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

// Extensions created for ease of access in data and separation of concerns

extension MusicSearchResponse: MusicSearchData {
    var musicResults: MusicResult {
        return results
    }
}

extension MusicSearchResponse.Result: MusicResult {
    var opensearchQuery: Query {
        return opensearch_query
    }
    
    var opensearchTotalResults: String {
        return opensearch_totalResults
    }
    
    var opensearchStartIndex: String {
        return opensearch_startIndex
    }
    
    var opensearchItemsPerPage: String {
        return opensearch_itemsPerPage
    }
    
    var artistMatch: ArtistMatch {
        return artistMatches
    }
    
    var attribute: ForQuery {
        return attributes
    }
    
}

extension MusicSearchResponse.Query: Query { }

extension MusicSearchResponse.ArtistMatch: ArtistMatch {
    var musicArtist: [MusicArtist] {
        return artist
    }
}

extension MusicSearchResponse.ArtistMatch.Artist : MusicArtist {
    var musicImage: [MusicImages] {
        return image
    }
}

extension MusicSearchResponse.ArtistMatch.Artist.Images: MusicImages { }

extension MusicSearchResponse.ForQuery: ForQuery {
    var forKey: String {
        return for_key
    }
}
