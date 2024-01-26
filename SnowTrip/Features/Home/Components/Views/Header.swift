//
//  Header.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var homeViewModel: HomeViewModel
    var body: some View {
        VStack{
            Text(homeViewModel.tageszeit(name: userViewModel.user?.name ?? ""))
                .padding()
                .font(.title)
                .foregroundColor(.black)
            Text(homeViewModel.monatssprüche())
                .padding([.top,.bottom],10)
                .font(.caption)
                .foregroundColor(.black)
                
        }
        .frame(width: 350)
        .padding()
        .background(Color.gray.opacity(0.8))
        .cornerRadius(25)
    }
}




#Preview {
    Header()
        .environmentObject(UserViewModel())
        .environmentObject(HomeViewModel())
}
