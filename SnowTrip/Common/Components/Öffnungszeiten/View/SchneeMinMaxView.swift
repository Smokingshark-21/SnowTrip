//
//  SchneeMinMaxView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 12.02.24.
//

import SwiftUI

struct SchneeMinMaxView: View {
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    var id : String
    var body: some View {
        ZStack{
            Image("Snow")
                .resizable()
            VStack{
                ForEach(snowviewmodel.ressortbyid,id: \.resortName){re in
                    Text("Schneetiefe")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    HStack{
                        
                        Text("Min: \(snowviewmodel.stringInDouble(sdata: re.avgBaseDepthMin ?? "")) cm")
                        
                        Text("Max: \(snowviewmodel.stringInDouble(sdata: re.avgBaseDepthMax ?? "")) cm")
                    }
                    .bold()
                }
            }
            .foregroundColor(.black)
            .onAppear {
                Task {
                    await snowviewmodel.fetchDataById(id: id)
                    print(snowviewmodel.ressortbyid)
                }
            }
        }
        .frame(width: 370,height: 100)
        .cornerRadius(25)
    }
}

#Preview {
    SchneeMinMaxView(id: "612002")
        .environmentObject(SnowApiViewModel())
}
