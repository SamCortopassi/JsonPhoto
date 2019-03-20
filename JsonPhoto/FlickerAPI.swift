//
//  FlickerAPI.swift
//  JsonPhoto
//
//  Created by Samantha Cortopassi on 3/20/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import Foundation

enum Method: String {
    case interestingPhotos = "flicker.interestingness.getList"
}

struct FlickerAPI {
    
    private static let baseURLString = "https://www.flickr.com/services/apps/create/noncommercial/?"
    private static let apiKey = "43c5e794edfa00dbbbfd6827f21b4168"
    
    
    private static func flickerURL(method: Method, parameters: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static var interestingPhotosURL: URL {
        return flickerURL(method: .interestingPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    
}
