//
//  UserPhotosInfoResponse.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import Foundation


import Foundation

struct UserPhotosInfoResponse: Codable {
    let photosInfo: UserPhotosResponse
    
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
}
