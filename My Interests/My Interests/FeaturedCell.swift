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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(_ note: Note) {
        let image = UIImage().convertBase64ToImage(imageString: note.thumbnail)
        thumbnail.image = image
        titleLabel.text = note.title
    }

}
