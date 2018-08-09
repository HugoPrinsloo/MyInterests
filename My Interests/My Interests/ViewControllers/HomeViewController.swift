//
//  ViewController.swift
//  My Interests
//
//  Created by Hugo Prinsloo on 2018/08/09.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import CloudKit

struct DummyData {
    static let items: [Note] = [Note(title: "Note 1", thumbnail: UIImage(named: "PHOTO1")!, text: "My First photo", url: "", images: []),
                                Note(title: "Note 2", thumbnail: UIImage(named: "PHOTO2")!, text: "dlfkjsalkfjdslkfjs dl", url: "", images: []),
                                Note(title: "Note 3", thumbnail: UIImage(named: "PHOTO3")!, text: "My First photo", url: "", images: []),
                                Note(title: "Note 4", thumbnail: UIImage(named: "PHOTO4")!, text: "My First photo", url: "", images: []),
                                Note(title: "Note 5", thumbnail: UIImage(named: "PHOTO5")!, text: "My First photo", url: "", images: []),]
}

class HomeViewController: UIViewController {
    
    private let manager = NoteMangager()
    
    private var items: [Note] = [] {
        didSet {
            DispatchQueue.main.async {
                self.featuredCollectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        featuredCollectionView.register(UINib(nibName: "FeaturedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeaturedCell")
        featuredCollectionView.dataSource = self
        featuredCollectionView.delegate = self
        manager.fetch { (notes) in
            self.items = notes
            print("Fetched \(notes.count) items")
        }
//        for item in items {
//            mangager.add(item)
//        }
//        mangager.add()
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCell", for: indexPath) as! FeaturedCell
        cell.configure(items[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
}



