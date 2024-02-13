//
//  NofallView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 09.02.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct NofallView: View {
    @State var anima:Bool = true
    @EnvironmentObject private var mybuddyViewModel : MyBuddysViewModel
    var body: some View {
        Color.red.opacity(0.2)
            .overlay(
                VStack{
                    AnimatedImage(name: "anima.gif", isAnimating: $anima)
                        .resizable()
                        .frame(width: 400,height: 400)
                    Button(action: {
                        mybuddyViewModel.status = 1
                    }, label: {
                        Text("Nofall Abrechen")
                    })
                    .foregroundColor(.white)
                    .padding()
                    .clipShape(.rect)
                    .background(Color.red)
                    .cornerRadius(25)
                    .offset(x: 10.0, y: 100)
                }
        
        )
            .ignoresSafeArea()
    }
}

#Preview {
    NofallView()
        .environmentObject(MyBuddysViewModel())
}
