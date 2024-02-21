//
//  FriendsView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 19.02.24.
//

import SwiftUI

struct FriendsView: View {
    @State var friend : Friend
    @State var standort = false
    var body: some View {
        HStack{
            Text(friend.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Divider()
            Toggle("Standort Teilen", isOn: $standort)
        }
        .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .background(Color.black.opacity(0.4).cornerRadius(10))
        .padding()
    }
}

#Preview {
    FriendsView(friend: Friend(id: "String", name: "test", gps: [Gpsdaten(longitude: "String", latitude: "String", status: 0)]))
}
