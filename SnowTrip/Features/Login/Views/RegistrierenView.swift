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
                .blur(radius: 2.0)

            VStack(){
                Spacer()
                Spacer()
                TextField("Benutzername",text: $name)
                    .frame(width: 300, height: 10)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                TextField("Email",text: $email)
                    .frame(width: 300, height: 10)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)

                SecureField("Passwort",text: $pass)
                    .frame(width: 300, height: 10)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)

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
