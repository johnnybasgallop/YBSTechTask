//
//  FlickrPhotosResponse.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 17/01/2024.
//

import Foundation

struct FlickrPhotosResponse: Codable {
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}
