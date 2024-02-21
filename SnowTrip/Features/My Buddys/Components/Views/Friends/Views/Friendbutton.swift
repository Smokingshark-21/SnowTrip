//
//  Friendbutton.swift
//  SnowTrip
//
//  Created by Max Brockauf on 21.02.24.
//

import SwiftUI

struct Friendbutton: View {
    @EnvironmentObject private var userviewmodel : UserViewModel

    var body: some View {
        NavigationStack{
            NavigationLink(destination: FriendHaupView()) {
                Text("Friends")
                    .frame(width: 300, height: 10)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .environmentObject(userviewmodel)
        }
    }
}

#Preview {
    Friendbutton()
        .environmentObject(UserViewModel())
}
