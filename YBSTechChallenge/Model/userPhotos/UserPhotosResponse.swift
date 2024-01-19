//
//  UserPhotosResponse.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import Foundation


import Foundation

struct UserPhotosResponse: Codable {
    let photos: [UsersPhotoModel]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}
