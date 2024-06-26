//
//  User.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import Foundation

struct FireUser :Codable {
    var id: String
    var freundesCode : String
    var name: String
    var password : String
    var email: String
    var registeredAt: Date
    var savedressort : [Ressort]
    var widgets : [Widget]
    var gps : [Gpsdaten]
    var friends : [Friend]
}
