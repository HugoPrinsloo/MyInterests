//
//  Note.swift
//  My Interests
//
//  Created by Hugo Prinsloo on 2018/08/09.
//  Copyright © 2018 Hugo. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

struct Note: Codable {
    let title: String
    let thumbnail: String
    let text: String?
    let url: String?
    let images: [String?]
    
    init(title: String, thumbnail: UIImage, text: String, url: String, images: [UIImage?]) {
        self.title = title
        self.thumbnail = thumbnail.convertImageToBase64()
        self.text = text
        self.url = url
        self.images = []
    }

}


class NoteMangager {
    
    struct Keys {
        static let recordType = "note"
    }
    
    let container = CKContainer.default()

    
    var notes: [Note] = []
    
    func fetch(completion: @escaping ((_ notes: [Note]) -> Void)) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: Keys.recordType, predicate: predicate)

        container.privateCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let records = records {
                for record in records {
                    if let dataString: String = record.value(forKey: Keys.recordType) as? String, let data = dataString.data(using: .ascii) {
                        if let note = try? JSONDecoder().decode(Note.self, from: data) {
                            self.notes.append(note)
                        }
                    }
                }
            }
            completion(self.notes)
        }
    }
    
    func add(_ note: Note) {
        let jsonEncoder = JSONEncoder()
        if let data = try? jsonEncoder.encode(note), let json = String(data: data, encoding: .utf8) {
            let record = CKRecord(recordType: Keys.recordType)
            record.setValue(json, forKey: Keys.recordType)
            container.privateCloudDatabase.save(record) { (recored, error) in
                print(error)
            }
        }
    }
    
    func delete(_ note: Note){
        
    }
    
}

public extension UIImage {
    func convertImageToBase64() -> String {
        let imageData = self.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
    func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }

}
