//
//  RessortByIdView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 29.01.24.
//

import SwiftUI

struct RessortByIdView: View {
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    let id : String
    var body: some View {
        ZStack{
            Image("LoginRegister")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 3.0)
            VStack{
                ForEach(snowviewmodel.ressortbyid,id: \.resortName){re in
                    
                    AsyncImage(url: re.lgTrailMapURL){
                        image in
                        image
                            .resizable()
                            .frame(minWidth: 300, minHeight: 300)
                        
                    }placeholder: {
                        ProgressView()
                    }
                    Text("Ressort Namme")
                        .foregroundColor(.white)
                    Text(re.resortName ?? "")
                        .foregroundColor(.white)
                    Text("Resoort Satus")
                        .foregroundColor(.white)
                    HStack{
                        Text(re.resortStatus ?? "" == "1" ? "Geöffnet" : "Geschlossen")
                        houseiconView(status: re.resortStatus ?? "")
                    }
                        .foregroundColor(.white)
                    if re.weekdayHours == ""{
                       
                    }else {
                        Text("Öffnungszeiten")
                            .foregroundColor(.white)
                        Text(re.weekdayHours ?? "")
                            .foregroundColor(.white)
                        Text(re.weekendHours ?? "")
                            .foregroundColor(.white)
                    }
                    
                    Text("Nachtabfahrten")
                        .foregroundColor(.white)
                    Text(re.nightSkiing ?? "" == "yes" ? "Ja" : "Nein")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 400,height: 500)
            .background(Color.black.opacity(0.4))
            .onAppear {
                Task {
                    await snowviewmodel.fetchDataById(id: id)
                    print(snowviewmodel.ressortbyid)
                }
            }
        }
    }
}


#Preview {
    RessortByIdView(id: "612002")
        .environmentObject(SnowApiViewModel())
}
