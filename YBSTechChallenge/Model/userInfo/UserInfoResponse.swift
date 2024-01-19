//
//  UserInfoResponse.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 18/01/2024.
//

import Foundation

struct UserInfoResponse : Codable {
    let person : UserInfo
    
    enum CodingKeys: String, CodingKey {
        case person
    }
}
