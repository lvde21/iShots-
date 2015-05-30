//
//  DribbbleAPI.swift
//  iShots
//
//  Created by Lala Vaishno De on 5/29/15.
//  Copyright (c) 2015 Casa Wee. All rights reserved.
//

import Foundation


class DribbbleAPI {
    
    let accessToken = "d676deb86ce53d7058d8e1bf40ebf9069fba67df00315fd02786615e8a4efe4b"
    
    
    // create function using completion handler that will return array of shots
    func loadShots(completion: (([Shot]) -> Void)!) {
        
        var urlString = "https://api.dribbble.com/v1/shots?access_token=" + accessToken
        
        let session = NSURLSession.sharedSession()
        
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!, completionHandler: { (data, response, error) -> Void in
            
            if(error != nil)
            {
                
                println(error)
                
            }
            else
            {
                
                // parse JSON
                
                var error : NSError?
                
                var shotsData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSArray
                
                
                // array of shot objects
                var shots = [Shot]()
                
                for shot in shotsData {
                    
                    let shot = Shot(data : shot as NSDictionary)
                    shots.append(shot)
                }
                
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        // runs to completion before joining main queue
                        completion(shots)
                    }
                }
                
            }
        })
        
        task.resume()
        
    }
    
}
