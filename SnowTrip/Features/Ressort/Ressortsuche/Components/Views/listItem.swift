//
//  listItem.swift
//  SnowTrip
//
//  Created by Max Brockauf on 29.01.24.
//

import SwiftUI

struct listItem: View {
    @EnvironmentObject var snowviewmodel : SnowApiViewModel
    var body: some View {
        Text(snowviewmodel.ressort)
    }
}

#Preview {
    listItem()
}
