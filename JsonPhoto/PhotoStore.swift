//
//  PhotoStore.swift
//  JsonPhoto
//
//  Created by Samantha Cortopassi on 3/20/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import Foundation

class PhotoStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchInterestingPhotos() {
        
        let url = FlickerAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
        
        if let jsonData = data {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        } else if let requestError = error {
            print("error fetching interesting photos: \(requestError)")
        } else {
            print("unezpected error with the request")
        }
    }
    task.resume()
}
}
