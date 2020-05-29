//
//  PhotoCollectionViewCell.swift
//  ALLIED
//
//  Created by Andrew on 2020/5/29.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    var imageUrl: String? {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

}
