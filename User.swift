//
//  User.swift
//  iShots
//
//  Created by Lala Vaishno De on 5/30/15.
//  Copyright (c) 2015 Casa Wee. All rights reserved.
//


// Model for User in JSON

import Foundation

class User {
    
    var userId : Int!
    var avatarUrl : String!
    var name : String!
    var location : String!
    var followingCount : Int!
    var followersCount : Int!
    var shotsCount : Int!
    
    var shotsUrl : String!
    var followingUrl : String!
    
    var avatarData : NSData?
    
    
    
    
    
    // constructor
    init(data : NSDictionary) {
        
        self.userId = data["id"] as Int
        self.name = getStringFromJSON(data, key : "name")
        self.avatarUrl = getStringFromJSON(data, key : "avatar_url")
        self.location = getStringFromJSON(data, key : "location")
        self.shotsUrl = getStringFromJSON(data, key : "shots_url")
        self.followingUrl = getStringFromJSON(data, key : "following_url")
        self.followingCount = data["followings_count"] as Int!
        self.followersCount = data["followers_count"] as Int!
        
        
        
    }
    
    
    // func allows better handling of String returns
    
    func getStringFromJSON(data : NSDictionary, key : String) -> String {
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
}
