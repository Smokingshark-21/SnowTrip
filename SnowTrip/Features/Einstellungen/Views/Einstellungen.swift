//
//  Einstellungen.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Einstellungen: View {
    @EnvironmentObject private var userViewModel: UserViewModel

    var body: some View {
        Image("LoginRegister")
            .resizable()
            .ignoresSafeArea()
            .overlay(
            Button("Abmelden"){
                userViewModel.logout()
            }
                .frame(width: 300, height: 10)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
        )
    }
}

#Preview {
    Einstellungen()
        .environmentObject(UserViewModel())

}
