//
//  ResultViewController.swift
//  ALLIED
//
//  Created by Andrew on 2020/5/28.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    private var photos = [Photo]()
    
    private let apiService = FlickrApiService()
    
    var key: String = "" {
        didSet {
            self.tabBarController?.navigationItem.title = "搜尋結果 \(key)"
        }
    }

    var count: String?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "\(PhotoCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        
        setupUI()
        
        fetchData()
    }
    

    func fetchData() {
        let request = FlickrRequestData.init(key: key, count: count ?? "0")
        
        apiService.getPhotos(request: request) { (data) in
            DispatchQueue.main.async {
                self.photos = data.photos.photo
                self.collectionView.reloadData()
            }
        }
    }
    
    
    private func setupUI() {
        let itemWidth = (collectionView.frame.width - 3 * 15) / 2 // layout margin = 15
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 25)
    }

}


extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        let photo = photos[indexPath.item]
        cell.name.text = photo.title
        
        apiService.downloadImage(url: photo.imageUrl) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    cell.image.image = image
                }
            }
        }
        
        return cell
    }
    
    
}
