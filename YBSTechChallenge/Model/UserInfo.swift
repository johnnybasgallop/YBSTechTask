//
//  UserInfoModel.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 18/01/2024.
//

import Foundation

struct UserInfo: Codable, Hashable {
    let nsid : String
    let iconServer : String
    let iconFarm : Int
    let username : Username
    
    var profileURL: URL {
        return URL(string: "https://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsid).jpg")!
    }
    
    
    enum CodingKeys: String, CodingKey {
        case nsid
        case iconServer = "iconserver"
        case iconFarm = "iconfarm"
        case username 
        
    }
}

struct Username: Codable, Hashable {
    let content: String
    
    enum CodingKeys: String, CodingKey{
        case content = "_content"
    }
    
   }
