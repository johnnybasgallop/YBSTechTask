//
//  AdditionalPhotoDetails.swift
//  YBSTechChallenge
//
//  Created by johnny basgallop on 19/01/2024.
//

import Foundation

struct AdditionalPhotoDetails: Codable,Hashable {
    
    let dateUploaded : String
    let description : Description
    
    
    var dateUploadedReal: Date {
        return Date(timeIntervalSince1970: TimeInterval(dateUploaded)!)
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: dateUploadedReal)
    }
    
    
    enum CodingKeys: String, CodingKey {
        case dateUploaded = "dateuploaded"
        case description
    }
}


struct Description: Codable, Hashable {
    let description : String
    
    
    enum CodingKeys : String, CodingKey {
        case  description = "_content"
    }
}
