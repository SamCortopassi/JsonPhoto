//
//  PhotoStore.swift
//  JsonPhoto
//
//  Created by Samantha Cortopassi on 3/20/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import Foundation

enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

class PhotoStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchInterestingPhotos(completion: @escaping (PhotosResult) -> Void) {
        
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
        let result = self.processPhotosRequest(data: data, error: error)
        completion(result )
        }
    task.resume()
}
    
    private func processPhotosRequest(data: Data?, error: Error?) -> PhotosResult {
    guard let jsonData = data else {
        return .failure(error!)
    }
    return FlickrAPI.photos(fromJSON: jsonData)
}
}
