//
//  ContentView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 23.01.24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userViewModel: UserViewModel

    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Login")
                    .resizable()
                    .frame(width: 600, height: 1000)
                    .offset(y: -60)
                    .ignoresSafeArea()
                
                SnowAnima()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    NavigationLink(destination: AnmeldenView().navigationBarHidden(true)) {
                        Text("Anmelden")
                            .frame(width: 300, height: 10)
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .navigationBarHidden(true)
                    
                    NavigationLink(destination: RegistrierenView().navigationBarHidden(true)) {
                        Text("Registrieren")
                            .frame(width: 300, height: 10)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .navigationBarHidden(true)
                }
                
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .offset(y: 330)
                
                
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(UserViewModel())
}
