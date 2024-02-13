//
//  Widget.swift
//  SnowTrip
//
//  Created by Max Brockauf on 12.02.24.
//

import Foundation

struct Widget:Codable,Identifiable{
    var name : String
    var status: Bool
    var offnung :Bool
    var karte : Bool
    var schnetiefe : Bool
    var id : String
}
