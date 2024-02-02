//
//  offnungszeiten.swift
//  SnowTrip
//
//  Created by Max Brockauf on 01.02.24.
//

import SwiftUI

struct offnungszeiten: View {
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    var id : String
    var body: some View {
        VStack{
            ForEach(snowviewmodel.ressortbyid,id: \.resortName){re in
                Text("Öffnungszeiten")
                    .bold()
                HStack{
                    Text(re.weekdayHours ?? "")
                        .padding()
                        .bold()
                        .frame(width: 150, height: 100)
                        .background(Color.cyan)
                        .cornerRadius(25)
                    Text(re.weekendHours ?? "")
                        .padding()
                        .bold()
                        .frame(width: 150, height: 100)
                        .background(Color.cyan)
                        .cornerRadius(25)
                }
            }
        }
        .padding()
        .frame(width: 370, height: 200)
        .background(Color.gray)
        .cornerRadius(25)
        .onAppear {
            Task {
                await snowviewmodel.fetchDataById(id: id)
                print(snowviewmodel.ressortbyid)
            }
        }
    }
}

#Preview {
    offnungszeiten(id: "612002")
        .environmentObject(SnowApiViewModel())
}
