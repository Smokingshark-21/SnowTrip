//
//  chatfield.swift
//  SnowTrip
//
//  Created by Max Brockauf on 14.02.24.
//

import SwiftUI

struct chatfield: View {
    var text : String
    var side : Bool
    var benutzname : String
    var date = Date()
    @State var sideinside:CGFloat = 100
    var body: some View {
        VStack{
            HStack{
                Text(benutzname)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .foregroundColor(.yellow)
            VStack{
                Text(text)
            }
            HStack{
                Text("\(date.formatted(.dateTime.hour().minute()))")
            }
            .foregroundColor(.white.opacity(0.5))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
        }
        .padding()
        .clipShape(.rect)
        .frame(width: 250)
        .background(side ? Color.green:Color.gray)
        .cornerRadius(25)
        .offset(x: side ? 60: -60)
    }
}

#Preview {
    chatfield(text: "Ich bin dumm", side: false, benutzname: "Max")
}
