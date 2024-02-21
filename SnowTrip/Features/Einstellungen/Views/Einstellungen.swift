//
//  Einstellungen.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Einstellungen: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State var name = ""
    var body: some View {
        ZStack{
            
            Image("LoginRegister")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 3.0)
            
            VStack{
                VStack{
                    Text("FreundesCode")
                        .foregroundColor(.gray)
                    Text(userViewModel.user?.freundesCode ?? "")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .frame(width: 380, height: 50)
                .background(Color.black.opacity(0.4))
                .cornerRadius(10)
                .padding()
                
                Textfield(textbesc: "Benuternamme", textfieldbeschrei: userViewModel.user?.name ?? "")
                
                Spacer()
                
                Button("Abmelden"){
                    userViewModel.logout()
                }
                .frame(width: 300, height: 10)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    Einstellungen()
        .environmentObject(UserViewModel())
    
}
