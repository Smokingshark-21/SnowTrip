//
//  Minichat.swift
//  SnowTrip
//
//  Created by Max Brockauf on 07.02.24.
//

import SwiftUI

struct Minichat: View {
    @State var textsenden = ""
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    chatfield(text: "Moin was geht", side: true, benutzname: "max")
                    chatfield(text: "test2", side: false, benutzname: "Pier")
                    chatfield(text: "Moin was geht", side: true, benutzname: "max")
                    chatfield(text: "test2", side: false, benutzname: "Pier")
                    chatfield(text: "Moin was geht", side: true, benutzname: "max")
                    chatfield(text: "test2", side: false, benutzname: "Pier")
                    chatfield(text: "Moin was geht", side: true, benutzname: "max")
                    chatfield(text: "test2", side: false, benutzname: "Pier")
                    chatfield(text: "Moin was geht", side: true, benutzname: "max")
                    chatfield(text: "test2", side: false, benutzname: "Pier")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 400)
            HStack{
                TextField("Chat", text: $textsenden)
                Button(action: {}, label: {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(45.0))
                })
            }
            .padding()
        }
        .background(Color.black.opacity(0.4))
    }
}

#Preview {
    Minichat()
}
