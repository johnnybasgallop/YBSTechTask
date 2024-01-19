//
//  FlickrPhotosInfoResponse.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 17/01/2024.
//

import Foundation

struct FlickrPhotosInfoResponse: Codable {
    let photosInfo: FlickrPhotosResponse
    
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
}
