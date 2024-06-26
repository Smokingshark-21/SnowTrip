//
//  FriendsView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 19.02.24.
//

import SwiftUI

struct FriendsView: View {
    @EnvironmentObject private var userviewmodel : UserViewModel
    @EnvironmentObject private var session : MultipeerSession
    @State var friend : Friend
    @State var standort = false
    var body: some View {
        HStack{
            Text(friend.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Divider()
            Toggle("Standort Teilen", isOn: $standort)
            Divider()
            Button(action: {
                print(userviewmodel.user?.friends)
                userviewmodel.deleteFriendFromFriendsList(friend.friendCode)
                print(userviewmodel.user?.friends)
            }, label: {
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
                
            })
//            if standort {
//                session.sendOrUpdateFriend(friend: friend)
//            }
        }
        .padding()
        .frame(width: 300, height: 50)
        .background(Color.black.opacity(0.4).cornerRadius(10))
        .padding()
    }
}

#Preview {
    FriendsView(friend: Friend(id: "String", name: "test", friendCode: "String", gps: [Gpsdaten(longitude: "String", latitude: "String", status: 0)]))
        .environmentObject(UserViewModel())
        .environmentObject(MultipeerSession())
}
