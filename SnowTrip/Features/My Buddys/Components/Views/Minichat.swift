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
            chatfield(text: "Moin was geht", side: true)
            chatfield(text: "Bist du dumm", side: false)
            HStack{
                TextField("Chat", text: $textsenden)
                Button(action: {}, label: {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(40.0))
                })
            }
            .padding()
        }
        .frame(width: 400,height: 300)
        .background(Color.black.opacity(0.4))
    }
}

#Preview {
    Minichat()
}
