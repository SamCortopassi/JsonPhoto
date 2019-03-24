//
//  PhotosViewController.swift
//  JsonPhoto
//
//  Created by Samantha Cortopassi on 3/20/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos {
            (PhotosResult) -> Void in
            
            switch PhotosResult {
            case let .success(photos):
                print("successfully found \(photos.count) photos.")
            case let .failure(error):
                print("error fetching interesting photos: \(error)")
            }
        }
    }
    
    
}


