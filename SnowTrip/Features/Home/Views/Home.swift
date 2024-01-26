//
//  Home.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var homeViewmodel: HomeViewModel
    var body: some View {
        ZStack{
            Image("LoginRegister")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 3.0)
            ScrollView{
                Header()
                    .environmentObject(userViewModel)
                    .environmentObject(homeViewmodel)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(UserViewModel())
        .environmentObject(HomeViewModel())
}
