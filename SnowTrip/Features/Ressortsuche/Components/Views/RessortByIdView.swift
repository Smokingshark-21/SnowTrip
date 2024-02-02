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
    let name : String
    var body: some View {
        NavigationStack{
            ZStack{
                Image("LoginRegister")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 3.0)
                    VStack{
                        ForEach(snowviewmodel.ressortbyid,id: \.resortName){re in

                            VStack{
                                
                                HStack{
                                    Text(re.resortStatus ?? "" == "1" ? "Geöffnet" : "Geschlossen")
                                    if re.resortStatus == "1" {
                                        Image(systemName: "house.and.flag")
                                            .foregroundColor(.green)
                                    }else {
                                        Image(systemName: "house.and.flag")
                                            .foregroundColor(.red)
                                    }
                                }
                                .foregroundColor(.white)
                            }
                            .offset(x:-100 )
                            
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
                    
                                AsyncImage(url: URL(string: "https://www.snow-country.com/trail_maps/large_trail_maps/\(re.id ?? "").jpg")){
                                    image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 350, height: 400)
                                }placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        
                    }
                    .frame(width: 500, height: 800)
                    .background(Color.black.opacity(0.4))
                    .onAppear {
                        Task {
                            await snowviewmodel.fetchDataById(id: id)
                            print(snowviewmodel.ressortbyid)
                        }
                    }
                }
            }
        .navigationTitle(name)

        }
    }


#Preview {
    RessortByIdView(id: "509001", name: "test")
        .environmentObject(SnowApiViewModel())
}
