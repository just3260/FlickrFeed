//
//  FlickrApiService.swift
//  ALLIED
//
//  Created by Andrew on 2020/5/30.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation
import UIKit

class FlickrApiService {
    
    private let apiKey = "fb974c428d9fab6cf4c6bbf4174370c2"
    
    
    func getPhotos(request: FlickrRequestData, complete: @escaping (FlickrModel) -> Void) {
        
        if let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(request.key)&per_page=\(request.count)&format=json&nojsoncallback=1") {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let data = data, let searchData = try? JSONDecoder().decode(FlickrModel.self, from: data) {
                        complete(searchData)
                    }
                }
            }.resume()
        }
    }
    
    
    func downloadImage(url: URL, complete: @escaping (UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                complete(image)
            } else {
                complete(nil)
            }
        }
        task.resume()
    }
    
}
