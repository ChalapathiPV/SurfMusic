//
//  MusicSearchResponse.swift
//  SurfMusic
//
//  Created by PVC on 09/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

struct MusicSearchResponse: Codable {

    struct Result: Codable {
        let opensearch_query: [Query]
        let opensearch_totalResults: String
        let opensearch_startIndex: String
        let opensearch_itemsPerPage: String
        let artistMatches:[Artist]
        let attributes:[ForQuery]

        private enum CodingKeys: String, CodingKey {
            case opensearch_query = "opensearch:Query"
            case opensearch_totalResults = "opensearch:totalResults"
            case opensearch_startIndex = "opensearch:startIndex"
            case opensearch_itemsPerPage = "opensearch:itemsPerPage"
            case artistMatches = "artistmatches"
            case attributes = "@attr"

        }
    }
    
    struct Query: Codable {
        let text:String
        let role:String
        let searchTerms:String
        let startPage:String
        
        private enum CodingKeys: String, CodingKey {
            case text = "#text", role, searchTerms, startPage
        }

    }
    
    struct Artist: Codable {
        let name:String
        let listeners:String
        let mbid:String
        let url:String
        let streamable:String
        let image:[Images]
        
        struct Images: Codable {
            let text:String
            let size:String
            
            private enum CodingKeys: String, CodingKey {
                case text = "#text", size
            }
        }
    }
    
    struct ForQuery: Codable {
        let for_key: String
        
        private enum CodingKeys: String, CodingKey {
            case for_key = "for"
        }
    }
    

}
