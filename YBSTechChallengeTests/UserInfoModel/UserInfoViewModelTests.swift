//
//  SearchViewModelTests.swift
//  YBSTechChallengeTests
//
//  Created by johnny basgallop on 17/01/2024.
//

import XCTest
@testable import YBSTechChallenge

final class UserInfoViewModelTests: XCTestCase {
    
    func testSuccessfulPhotoSearch(){
        let searchViewModel = UserInfoViewModel()
        searchViewModel.userPhotos = []
        
        searchViewModel.searchPhotos(for: "Yorkshire",page: 1){completion in
            if completion{
                XCTAssertGreaterThan(searchViewModel.userPhotos.count, 0)
            }
            
            if !completion{
                XCTAssertEqual(searchViewModel.userPhotos.count, 0)
            }
        }
    }
    
    
    
}
    
