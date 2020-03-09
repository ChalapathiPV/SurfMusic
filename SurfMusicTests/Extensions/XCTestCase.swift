//
//  XCTestCase.swift
//  SurfMusicTests
//
//  Created by PVC on 10/03/20.
//  Copyright © 2020 Chalapathi. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func loadStub(name: String, extension: String) -> Data {
          let bundle = Bundle(for: classForCoder)
          let url = bundle.url(forResource: name, withExtension: `extension`)

          return try! Data(contentsOf: url!)
      }
    
}
