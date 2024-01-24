//
//  Home.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var userViewModel: UserViewModel

    var body: some View {
        ZStack{
            Image("LoginRegister")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 3.0)
            ScrollView{
                Header()
                    .environmentObject(userViewModel)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(UserViewModel())
}
