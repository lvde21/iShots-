//
//  Shot.swift
//  iShots
//
//  Created by Lala Vaishno De on 5/29/15.
//  Copyright (c) 2015 Casa Wee. All rights reserved.
//

import Foundation


// creating a class for each shot to help parse JSON items

class Shot {
    
    
    var id : Int!
    var title : String!
    var date : String!
    var description : String!
    var commentsCount : Int!
    var likesCount : Int!
    var viewsCount : Int!
    
    var commentUrl : String!
    var imageUrl : String!
    
    var imageData : NSData?
    
    // creating User object
    var user : User!
    
    
    /*

"id" : 471756,
"title" : "Sasquatch",
"description" : "<p>Quick, messy, five minute sketch of something that might become a fictional something.</p>",
"width" : 400,
"height" : 300,
"images" : {
"hidpi" : null,
"normal" : "https://d13yacurqjgara.cloudfront.net/users/1/screenshots/471756/sasquatch.png",
"teaser" : "https://d13yacurqjgara.cloudfront.net/users/1/screenshots/471756/sasquatch_teaser.png"
},
"views_count" : 4372,
"likes_count" : 149,
"comments_count" : 27,
"attachments_count" : 0,
"rebounds_count" : 2,
"buckets_count" : 8,
"created_at" : "2012-03-15T01:52:33Z",
"updated_at" : "2012-03-15T02:12:57Z",
"html_url" : "https://dribbble.com/shots/471756-Sasquatch",
"attachments_url" : "https://api.dribbble.com/v1/shots/471756/attachments",
"buckets_url" : "https://api.dribbble.com/v1/shots/471756/buckets",
"comments_url" : "https://api.dribbble.com/v1/shots/471756/comments",
"likes_url" : "https://api.dribbble.com/v1/shots/471756/likes",
"projects_url" : "https://api.dribbble.com/v1/shots/471756/projects",
"rebounds_url" : "https://api.dribbble.com/v1/shots/471756/rebounds",
"tags" : [
"fiction",
"sasquatch",
"sketch",
"wip"
    */



    // setting values from dictionary

    init(data : NSDictionary)
    {
        self.id = data["id"] as Int
        self.commentsCount = data["comments_count"] as Int
        self.likesCount = data["likes_count"] as Int
        self.viewsCount = data["views_count"] as Int
        
        self.commentUrl = getStringFromJSON(data, key : "comments_url")
        self.title = getStringFromJSON(data, key : "title")
        
        // getting date
        let dateInfo = getStringFromJSON(data, key: "created_at")
        self.date = dateInfo
        
        
        let desc = getStringFromJSON(data, key: "description")
        self.description = desc
        
        
        let images = data["images"] as NSDictionary
        self.imageUrl = getStringFromJSON(images, key: "normal")
        
    
        
        if let userData = data["user"] as? NSDictionary {
            
            self.user = User(data: userData)
        }
        
        
    }
    
    
    
    // func allows better handling of String returns
    
    func getStringFromJSON(data : NSDictionary, key : String) -> String {
        
        
        if let info = data[key] as? String {
            
            return info
        }
        
        return ""
    }
    

}
