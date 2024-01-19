//
//  UsersPhotoModel.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import Foundation

struct UsersPhotoModel: Codable ,Identifiable, Hashable {
    let title: String
    let farm : Int
    let id: String
    let secret: String
    let server : String
    let owner : String
    var userInfo : UserInfo?
    var additionalDetails : AdditionalPhotoDetails?
    
    
    var imageURL: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg")!
    }
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case id = "id"
        case secret
        case server
        case farm
        case owner
    }
}
