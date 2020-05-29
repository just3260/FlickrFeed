//
//  FlickrRequestData.swift
//  ALLIED
//
//  Created by Andrew on 2020/5/30.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation

class FlickrRequestData: NSObject {
    
    let key: String
    let count: String
    
    init(key: String, count: String) {
        self.key = key
        self.count = count
    }
}
