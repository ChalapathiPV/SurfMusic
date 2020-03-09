//
//  MusicListViewModelTests.swift
//  SurfMusicTests
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import XCTest
@testable import SurfMusic

class MusicListViewModelTests: XCTestCase {

    // MARK: - Properties

    var viewModel: MusicListViewModel!

    override func setUp() {
        super.setUp()
        
        // Load Stub
        let data = loadStub(name: "lastFM", extension: "json")

        // Initialize JSON Decoder
        let decoder = JSONDecoder()

        // Configure JSON Decoder
        decoder.dateDecodingStrategy = .secondsSince1970

        // Initialize Dark Sky Response
        let musicSearchResponse = try! decoder.decode(MusicSearchResponse.self, from: data)

        // Initialize View Model
        viewModel = MusicListViewModel(musicData: musicSearchResponse)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests for Number of albums

    func testNumberOfAlbums() {
        XCTAssertEqual(viewModel.numberOfAlbums, 30)
    }
}
