//
//  User.swift
//  RandomUser
//
//  Created by ksd on 21/09/2023.
//

import Foundation


struct RandomUserResult: Decodable {
    let results: [User]
}

struct User: Decodable, Identifiable {
    let id = UUID().uuidString
    let name: Name
    let picture: Picture
    let location:Location
    
    var fullName: String {
        return "\(name.title) \(name.first) \(name.last)"
    }
    
    struct Name: Decodable {
        let title: String
        let first: String
        let last: String
    }
    
    struct Picture: Decodable {
        let large: URL
    }
    
    struct Location: Decodable {
        let coordinates: Coordinates
        
        struct Coordinates: Decodable {
            let latitude: String
            let longitude: String
        }
    }
}
