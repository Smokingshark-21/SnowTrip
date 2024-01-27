//
//  searchresponse.swift
//  SnowTrip
//
//  Created by Max Brockauf on 26.01.24.
//

import Foundation

struct searchresponse: Codable {
    let items : [Item]
}

struct Item: Codable {
    let id: String
    let resortName: String
    let state: String
    let region: String
    let resortType: String
}
