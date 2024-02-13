//
//  RessortByIdView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 29.01.24.
//

import SwiftUI

struct RessortByIdView: View {
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    @EnvironmentObject private var ressortviewmodel : RessortViewModel
    @EnvironmentObject private var userviewmodel : UserViewModel
    @State var zoom = false
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
                                    .aspectRatio(contentMode: zoom ? .fill: .fit)
                                    .onTapGesture{
                                        withAnimation{
                                            zoom.toggle()
                                        }
                                    }
                                    .frame(width: 350, height: 400)
                            }placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.4))
                .onAppear {
                    Task {
                        await snowviewmodel.fetchDataById(id: id)
                    }
                }
            }
        }
        .navigationTitle(name)
        .toolbar {
            Button {
                ressortviewmodel.addresort(ressort: snowviewmodel.ressortbyid.first!)
                userviewmodel.saveRessort(with: ressortviewmodel.resortlist)
            } label: {
                if ressortviewmodel.resortlist.contains(where: { $0.id == snowviewmodel.ressortbyid.first!.id }){
                    Image(systemName: "checkmark.square")
                        .foregroundColor(.green)
                }else{
                    Image(systemName: "plus.square")
                }
                
            }
        }
    }
}

#Preview {
    RessortByIdView(id: "509001", name: "test")
        .environmentObject(SnowApiViewModel())
        .environmentObject(RessortViewModel())
        .environmentObject(UserViewModel())
}
