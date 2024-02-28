//
//  FriendHaupView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 19.02.24.
//

import SwiftUI

struct FriendHaupView: View {
    @EnvironmentObject private var userviewmodel : UserViewModel
    @EnvironmentObject private var session : MultipeerSession

    @State var code = ""
    @State var notbut = false
    var body: some View {
        ZStack{
            Image("LoginRegister")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 3.0)
            VStack{
                HStack{
                    TextField("FreundesCode", text: $code)
                        .textFieldStyle(.roundedBorder)
                        .background(Color.black.opacity(0.4))
                        .textContentType(.postalCode)
                    Button(action: {
                        
                        userviewmodel.getFriendIfFriendCodeExists(code) { friend in
                            if let friend = friend {
                                userviewmodel.saveFriend(with: [friend])
                                userviewmodel.fetchUser(with: userviewmodel.user?.id ?? "")
                                // test sseion
                                session.sendOrUpdateFriend(friend: friend)
                            } else {
                                notbut.toggle()
                            }
                            
                        }
                        
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .foregroundColor(.gray)
                            
                    })
                    .frame(width: 30, height: 30)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black.cornerRadius(10))
                .padding()
                
                ScrollView{
                    ForEach(userviewmodel.user?.friends ?? [] ,id: \.name) { friend in
                        FriendsView(friend: friend)
                            .environmentObject(userviewmodel)
                           
                        
                    }
                }

            }
            .alert("Freund nicht gefunden oder Fehler beim Abrufen der Daten.",isPresented: $notbut){
                Button("Okay",role: .none) {}
        }
           
        }
    }
}

#Preview {
    FriendHaupView()
        .environmentObject(UserViewModel())
        .environmentObject(MultipeerSession())
}
