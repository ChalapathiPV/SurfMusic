//
//  AlbumRepresentable.swift
//  SurfMusic
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import Foundation
import UIKit

protocol AlbumRepresentable {
    
    var albumName: String { get }
    var listners: String { get }
    var albumUrl:String { get }
    var imageUrl: String? { get }
    
}
