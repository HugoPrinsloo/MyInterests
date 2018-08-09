//
//  ViewController.swift
//  My Interests
//
//  Created by Hugo Prinsloo on 2018/08/09.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

struct Note {
    let title: String
    let thumbnail: String
    
}

class HomeViewController: UIViewController {
    
    var items: [Note] = []
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        featuredCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        listCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as! FeedCell
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10//items.count
    }
    
    
}



class FeedCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        contentView.backgroundColor = .lightGray
    }
}
