//
//  Header.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        VStack{
            Text(tageszeit(name: userViewModel.user?.name ?? ""))
                .padding()
                .font(.title)
        }
        .frame(width: 300)
        .padding()
        .background(Color.gray.opacity(0.8))
        .cornerRadius(25)
    }
}


func tageszeit(name:String) -> String {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    
    if (hour >= 6 && hour < 12) {
        return "Guten Morgen \(name)"
    } else if (hour >= 12 && hour < 18) {
        return "Guten Tag \(name)"
    } else {
        return "Guten Abend \(name)"
    }
}

#Preview {
    Header()
        .environmentObject(UserViewModel())
}
