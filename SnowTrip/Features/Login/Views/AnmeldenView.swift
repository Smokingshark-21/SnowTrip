//
//  AnmeldenView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 23.01.24.
//

import SwiftUI

struct AnmeldenView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State var email = ""
    @State var pass = ""
    @State var name = ""
    var body: some View {
        ZStack{
            Image("LoginRegister")
                .resizable()
                .ignoresSafeArea()
            VStack(){
                Spacer()
                Spacer()
                TextField("Email",text: $email)
                    .frame(width: 300, height: 10)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                SecureField("Passwort",text: $pass)
                    .frame(width: 300, height: 10)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                Button(action: {
                    
                }, label: {
                    Text("Passwort Vergessen ?")
                        .font(.caption)
                        .bold()
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.horizontal ,40)
                        .foregroundColor(.white)
                    
                })
                Spacer()
                Button("Anmelden"){
                    userViewModel.login(email: email, password: pass)
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
    AnmeldenView()
        .environmentObject(UserViewModel())
}
