//
//  FlickrModel.swift
//  ALLIED
//
//  Created by Andrew on 2020/5/29.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

struct FlickrModel: Codable {
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    let page, pages, perpage: Int
    let total: String
    let photo: [Photo]
}

//struct Photo: Decodable {
//    let farm: Int
//    let secret: String
//    let id: String
//    let server: String
//    let title: String
//    var imageUrl: URL {
//        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
//    }
//
//}


struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    
    var imageUrl: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
    }
}

