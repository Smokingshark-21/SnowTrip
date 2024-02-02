//
//  houseiconView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 02.02.24.
//

import SwiftUI

struct houseiconView: View {
    var status : String
    var body: some View {
        if status == "1" {
            Image(systemName: "house.and.flag")
                .foregroundColor(.green)
        }else {
            Image(systemName: "house.and.flag")
                .foregroundColor(.red)
        }
    }
}

#Preview {
    houseiconView(status: "1")
}
