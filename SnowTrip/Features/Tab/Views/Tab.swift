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
    var body: some View {
        TabView{
            Home()
                .environmentObject(userViewModel)
                .environmentObject(homeViewmodel)
                .tabItem { Label("Home", systemImage: "house") }
          
            Ressortsuche()
                .environmentObject(userViewModel)
                .tabItem { Label("Suche", systemImage: "magnifyingglass") }
               
            GespeicherteRessort()
                .environmentObject(userViewModel)
                .tabItem { Label("Ressorts", systemImage: "tray.full") }
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
}
