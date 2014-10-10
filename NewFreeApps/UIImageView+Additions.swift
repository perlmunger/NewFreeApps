//
//  UIImageView+Additions.swift
//  NewFreeApps
//
//  Created by Matt Long on 10/9/14.
//  Copyright (c) 2014 Matt Long. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImageWithURL(url:NSURL) {
        
        var task = NSURLSession.sharedSession().downloadTaskWithRequest(NSURLRequest(URL: url), completionHandler: { (localUrl, response, error) -> Void in
            
            let data = NSData(contentsOfURL: localUrl)
            self.image = UIImage(data: data)
        })
        
        task.resume()
    }
    
}