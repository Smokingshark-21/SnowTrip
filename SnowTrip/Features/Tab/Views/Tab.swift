//
//  Tab.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Tab: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var homeViewmodel: HomeViewModel
    @EnvironmentObject private var resortviewmodel :RessortViewModel
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
   
    var body: some View {
        TabView{
            Home()
                .environmentObject(userViewModel)
                .environmentObject(homeViewmodel)
                .environmentObject(snowviewmodel)
                .environmentObject(resortviewmodel)
                .tabItem { Label("Home", systemImage: "house") }
            
            Ressortsuche()
                .environmentObject(userViewModel)
                .environmentObject(homeViewmodel)
                .environmentObject(snowviewmodel)
                .environmentObject(resortviewmodel)
                .tabItem { Label("Suche", systemImage: "magnifyingglass") }
            
            if resortviewmodel.resortlist.isEmpty{
                
            }
            else{
                GespeicherteRessort()
                    .environmentObject(resortviewmodel)
                    .environmentObject(snowviewmodel)
                    .environmentObject(homeViewmodel)
                    .environmentObject(userViewModel)
                    .tabItem { Label("Ressorts", systemImage: "tray.full") }
            }
            
            MyBuddys()
                .tabItem { Label("My Buddys", systemImage: "figure.snowboarding") }
            
            Einstellungen()
                .environmentObject(userViewModel)
                .tabItem { Label("Einstellungen", systemImage: "gear") }
            
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .black
            UITabBar.appearance().unselectedItemTintColor = .gray
            
        }
    }
}

#Preview {
    Tab()
        .environmentObject(UserViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(RessortViewModel())
        .environmentObject(SnowApiViewModel())
}
