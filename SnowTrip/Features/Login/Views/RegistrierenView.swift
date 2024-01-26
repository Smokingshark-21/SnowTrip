//
//  RegistrierenView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 23.01.24.
//

import SwiftUI

struct RegistrierenView: View {
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
                TextField("Benutzername",text: $name)
                    .frame(width: 300, height: 10)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
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
                Spacer()
                Button("Registrieren"){
                    userViewModel.register(email: email, password: pass, name: name)
                    if userViewModel.userIsLoggedIn {
                        NavigationLink(destination: Tab()) {
                            EmptyView()
                        }
                    }
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
    RegistrierenView()
        .environmentObject(UserViewModel())
}
