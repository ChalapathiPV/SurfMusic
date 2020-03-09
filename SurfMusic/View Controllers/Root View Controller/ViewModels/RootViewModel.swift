//
//  RootViewModel.swift
//  SurfMusic
//
//  Created by PVC on 09/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

class RootViewModel {
    
    // MARK: - Type Aliases

    typealias DidFetchMusicDataCompletion = (Data?, Error?) -> Void

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
        
        URLSession.shared.dataTask(with: baseUrl) { (data, response, error) in
            if let error = error {
                self.didFetchMusicData?(nil, error)
            } else if let data = data {
                self.didFetchMusicData?(data, nil)
            } else {
                self.didFetchMusicData?(nil, nil)
            }
        }.resume()
    }

}
