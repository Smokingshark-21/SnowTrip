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
                    VStack{
                        Text("Ressort")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text(re.resortName ?? "")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 400, height: 50)
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .offset(y: -250)
                    
                    VStack{
                        HStack{
                            Text(re.resortStatus ?? "" == "1" ? "Geöffnet" : "Geschlossen")
                            houseiconView(status: re.resortStatus ?? "")
                        }
                        .foregroundColor(.white)
                    }
                    .offset(x:-100 ,y: -200)
                    
                    VStack{
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
                        
                        AsyncImage(url: re.logo){
                            image in
                            image
                                .resizable()
                                .frame(minWidth: 100, minHeight: 300)
                            
                        }placeholder: {
                            Image(systemName: "house")
                        }
                    }
                }
            }
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
