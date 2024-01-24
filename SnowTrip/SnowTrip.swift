//
//  SnowTripApp.swift
//  SnowTrip
//
//  Created by Max Brockauf on 23.01.24.
//

import SwiftUI
import Firebase

@main
struct SnowTripApp: App {
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            if userViewModel.userIsLoggedIn {
                Tab()
                    .environmentObject(userViewModel)
            } else{
                LoginView()
                    .environmentObject(UserViewModel())
            }
        }
    }
}
