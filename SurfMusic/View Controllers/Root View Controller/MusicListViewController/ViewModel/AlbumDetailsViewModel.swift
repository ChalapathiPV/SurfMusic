//
//  AlbumDetailsViewModel.swift
//  SurfMusic
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation
import UIKit

struct AlbumDetailsViewModel {
    
    // MARK: - Properties
    
    let albumData: MusicArtist
    
    var albumName: String {
        return albumData.name
    }
    
    var listners: String {
        return albumData.listeners
    }
    
    var albumUrl: String {
        return albumData.url
    }
    
    var imageUrl: String? {
        guard let url = albumData.musicImage.last else {
            return nil
        }
        return url as? String
    }
}

extension AlbumDetailsViewModel: AlbumRepresentable
{
}
