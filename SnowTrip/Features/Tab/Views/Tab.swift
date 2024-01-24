//
//  Tab.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Tab: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    var body: some View {
        TabView{
            Home()
                .environmentObject(userViewModel)
                .tabItem { Label("", systemImage: "house") }
            Ressortsuche()
                .environmentObject(userViewModel)
                .tabItem { Label("", systemImage: "magnifyingglass") }
            GespeicherteRessort()
                .environmentObject(userViewModel)
                .tabItem { Label("", systemImage: "tray.full") }
            Einstellungen()
                .environmentObject(userViewModel)
                .tabItem { Label("", systemImage: "gear") }
           
        }
    }
}

#Preview {
    Tab()
        .environmentObject(UserViewModel())
}
