//
//  Note.swift
//  My Interests
//
//  Created by Hugo Prinsloo on 2018/08/09.
//  Copyright © 2018 Hugo. All rights reserved.
//

import Foundation
import UIKit

struct Note {
    let title: String
    let thumbnail: UIImage
    let text: String?
    let url: String?
    let images: [UIImage?]
    
    init(title: String, thumbnail: UIImage, text: String, url: String, images: [UIImage?]) {
        self.title = title
        self.thumbnail = thumbnail
        self.text = text
        self.url = url
        self.images = images
    }
}


