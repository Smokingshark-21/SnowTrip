//
//  MyBuddysViewModel.swift
//  SnowTrip
//
//  Created by Max Brockauf on 07.02.24.
//

import Foundation
import SwiftUI

class MyBuddysViewModel : ObservableObject {
    
    @Published var status = 0
    
    func statusinttocolor()-> Color{
        switch status {
        case 0 :
            return Color.green
        case 1 :
            return Color.yellow
        case 3 :
            return Color.red
        default:
            return Color.green
        }
    }
}
