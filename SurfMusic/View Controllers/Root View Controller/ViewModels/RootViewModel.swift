//
//  RootViewModel.swift
//  SurfMusic
//
//  Created by PVC on 09/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

class RootViewModel {
    
    // MARK: - Types
    
    enum MusicDataError: Error {
        case noMusicDataAvailable
    }
    
    // MARK: - Type Aliases
    
    typealias DidFetchMusicDataCompletion = (MusicSearchData?, MusicDataError?) -> Void
    
    // MARK: - Properties
    
    var didFetchMusicData: DidFetchMusicDataCompletion?
    
    // MARK: - Initialization
    
    init() {
        // Fetch  Data
        fetchMusicListData()
    }
    
    // MARK: - Helper Methods
    
    
    private func fetchMusicListData() {
        
        
        //Initialize Music search request
        let musicSearchrequest = MusicSearchRequest(baseUrl: MusicSearchService.baseUrlString, artist: "Distributed", album: "")
        
        guard let baseUrl = musicSearchrequest.url else {
            return
        }
        
        URLSession.shared.dataTask(with: baseUrl) { [weak self](data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            if let error = error {
                print("Unable to Fetch  Data \(error)")
                self?.didFetchMusicData?(nil, .noMusicDataAvailable)
            } else if let data = data {
                // Initialize JSON Decoder
                let decoder = JSONDecoder()
                do {
                    // Decode JSON Response
                    let searchResponse = try decoder.decode(MusicSearchResponse.self, from: data)
                    
                    // Invoke Completion Handler
                    self?.didFetchMusicData?(searchResponse, nil)
                } catch {
                    print("Unable to Decode JSON Response \(error)")
                    // Invoke Completion Handler
                    self?.didFetchMusicData?(nil, .noMusicDataAvailable)
                }
            } else {
                self?.didFetchMusicData?(nil, nil)
            }
        }.resume()
    }
    
}
