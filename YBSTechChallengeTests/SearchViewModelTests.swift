//
//  SearchViewModelTests.swift
//  YBSTechChallengeTests
//
//  Created by johnny basgallop on 17/01/2024.
//

import XCTest
@testable import YBSTechChallenge

final class SearchViewModelTests: XCTestCase {
    
    func testSuccessfulPhotoSearch(){
        let searchViewModel = SearchBarViewModel()
        searchViewModel.flickrPhotos = []
        
        searchViewModel.searchPhotos(for: "Yorkshire"){completion in
            if completion{
                XCTAssertGreaterThan(searchViewModel.flickrPhotos.count, 0)
            }
            
            if !completion{
                XCTAssertEqual(searchViewModel.flickrPhotos.count, 0)
            }
        }
        
        
        
    }
}
    
