//
//  Photo.swift
//  JsonPhoto
//
//  Created by Samantha Cortopassi on 3/21/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
}
