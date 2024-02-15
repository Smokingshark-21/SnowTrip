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
    @State var sideinside:CGFloat = 100
    var body: some View {
        VStack{
            Text(text)
        }
        .padding()
        .clipShape(.rect)
        .background(side ? Color.green:Color.gray)
        .cornerRadius(25)
        .offset(x: side ? 100: -100)
    
    }
}

#Preview {
    chatfield(text: "Ich bin dumm", side: false)
}
