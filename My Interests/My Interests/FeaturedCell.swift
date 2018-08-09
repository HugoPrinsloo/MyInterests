//
//  FeaturedCollectionViewCell.swift
//  My Interests
//
//  Created by Hugo Prinsloo on 2018/08/09.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(_ note: Note) {
        thumbnail.image = note.thumbnail
    }

}
