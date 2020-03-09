//
//  MusicListViewModel.swift
//  SurfMusic
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation

struct MusicListViewModel {
    
    // MARK: - Properties
       
       let musicData: MusicSearchData
    
    var numberOfAlbums: Int {
        return musicData.musicResults.artistMatch.musicArtist.count
    }
    
    // MARK: - Methods
    
    func viewModel(for index: Int) -> AlbumDetailsViewModel {
        return AlbumDetailsViewModel(albumData: musicData.musicResults.artistMatch.musicArtist[index])
    }
}
