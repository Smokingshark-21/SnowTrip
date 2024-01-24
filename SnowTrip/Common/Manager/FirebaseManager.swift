//
//  FirebaseManager.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager {
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    var userId: String? {
            auth.currentUser?.uid
        }
}
