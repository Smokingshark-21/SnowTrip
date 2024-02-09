//
//  RessortViewModel.swift
//  SnowTrip
//
//  Created by Max Brockauf on 05.02.24.
//

import Foundation

class RessortViewModel: ObservableObject {
    
    @Published var resortlist:[Ressort] = []
    
    func addresort(ressort:Ressort){
        if resortlist.isEmpty{
            resortlist = [ressort]
        }else if !resortlist.contains(where: { $0.id == ressort.id }) {
            resortlist.append(ressort)
        }
        
    }
    
}
