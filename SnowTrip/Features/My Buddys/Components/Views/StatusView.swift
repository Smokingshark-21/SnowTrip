//
//  StatusView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 07.02.24.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        VStack{
            Text("Status")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            HStack(alignment: .center, spacing: 50){
                Button {
                    
                } label: {
                    Text("Okay")
                        .foregroundColor(.white)
                        .padding(10)
                        .clipShape(.rect)
                        .background(Color.green)
                        .cornerRadius(10)
                    
                }
                
                Button {
                    
                } label: {
                    Text("Pause")
                        .foregroundColor(.white)
                        .padding(10)
                        .clipShape(.rect)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                
                Button {
                    
                } label: {
                    Text("Notfall")
                        .foregroundColor(.white)
                        .padding(10)
                        .clipShape(.rect)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    StatusView()
}
