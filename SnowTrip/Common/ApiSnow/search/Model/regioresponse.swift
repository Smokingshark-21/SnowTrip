//
//  searchresponse.swift
//  SnowTrip
//
//  Created by Max Brockauf on 26.01.24.
//

import Foundation

struct regioresponse: Codable {
    let items : [Items]
}

struct Items: Codable,Hashable {
    let id: String
    let resortName: String
    let state: String
    let region: String
    let resortType: String
}
