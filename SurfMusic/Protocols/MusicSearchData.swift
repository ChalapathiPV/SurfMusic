//
//  MusicSearchData.swift
//  SurfMusic
//
//  Created by PVC on 09/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

protocol MusicSearchData {
    
    var musicResults: MusicResult { get }
    
}

protocol MusicResult {
    
    var opensearchQuery: Query { get }
    var opensearchTotalResults: String { get }
    var opensearchStartIndex: String { get }
    var opensearchItemsPerPage: String { get }
    var artistMatch:ArtistMatch { get }
    var attribute:ForQuery { get }
    
}

protocol Query {
    
    var text:String { get }
    var role:String { get }
    var searchTerms:String { get }
    var startPage:String { get }
    
}

protocol ForQuery {
    
    var forKey:String { get }
    
}

protocol ArtistMatch {
    
    var musicArtist: [MusicArtist] { get }
    
}

protocol MusicArtist {
    
    var name:String { get }
    var listeners:String { get }
    var mbid:String { get }
    var url:String { get }
    var streamable:String { get }
    var musicImage:[MusicImages] { get }
    
}

protocol MusicImages {
    
    var text:String { get }
    var size:String { get }
    
}

