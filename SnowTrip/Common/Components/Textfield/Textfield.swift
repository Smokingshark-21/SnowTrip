//
//  Textfield.swift
//  SnowTrip
//
//  Created by Max Brockauf on 19.02.24.
//

import SwiftUI

struct Textfield: View {
    var textbesc : String
    var textfieldbeschrei : String
    @State var outcome = ""
    var body: some View {
        VStack(spacing: 0){
            Text(textbesc)
                .offset(y: 30.0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            TextField(textfieldbeschrei, text: $outcome)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
                .background(Color.black.opacity(0.4).cornerRadius(10))
                .foregroundColor(.white)
                .padding()
            
        }
        .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    Textfield(textbesc: "Benutzernamme", textfieldbeschrei: "User")
}
