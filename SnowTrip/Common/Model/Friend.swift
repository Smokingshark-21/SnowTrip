//
//  Friend.swift
//  SnowTrip
//
//  Created by Max Brockauf on 19.02.24.
//

import Foundation

struct Friend :Codable,Identifiable {
    var id : String
    var name : String
    var friendCode : String
    var gps : [Gpsdaten]
    
    var description: String {
            return "Friend(id: \(id), name: \(name), friendCode: \(friendCode), gps: \(gps))"
        }
}
