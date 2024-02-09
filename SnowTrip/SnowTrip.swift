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
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var resortviewmodel = RessortViewModel()
    @StateObject private var snowviewmodel = SnowApiViewModel()


    var body: some Scene {
        WindowGroup {
            if userViewModel.userIsLoggedIn {
                Tab()
                    .environmentObject(userViewModel)
                    .environmentObject(homeViewModel)
                    .environmentObject(resortviewmodel)
                    .environmentObject(snowviewmodel)
            } else{
                LoginView()
                    .environmentObject(userViewModel)
            }
        }
    }
}
