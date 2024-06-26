//
//  Ressortsuche.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Ressortsuche: View {
    @EnvironmentObject private var userviewmodel : UserViewModel
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    @EnvironmentObject private var ressortviewmodel : RessortViewModel
    @EnvironmentObject private var homeViewModel : HomeViewModel
    @State var region = "usa"
    private var regi = ["northwest","southwest","rockies","midwest","northeast","southeast","usa","canada","europe"]
    var body: some View {
        NavigationStack{
            ZStack{
                Image("LoginRegister")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 3.0)
                Spacer()
                VStack{
                    HStack{
                        Text("Region")
                            .foregroundColor(.white)

                        Picker("Region", selection: $region){
                            ForEach(regi,id: \.self){
                                Text($0.uppercased())
                            }
                        }
                        .onChange(of: region,perform: { _ in
                            snowviewmodel.searchString = region
                            snowviewmodel.fetchDataRegion()
                        })
                    }
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(25)
                    ScrollView{
                        ForEach(snowviewmodel.items, id: \.resortName){re in
                            NavigationLink( destination: RessortByIdView(id: re.id,name: re.resortName)
                                .environmentObject(snowviewmodel)
                                .environmentObject(ressortviewmodel)
                                .environmentObject(userviewmodel)
                                .environmentObject(homeViewModel)){
                                VStack{
                                    Text(re.resortName)
                                        .foregroundColor(.white.opacity(0.9))

                                    Text(re.state)
                                        .foregroundColor(.gray)

                                    Divider()
                                        .colorInvert()
                                }
                                .foregroundColor(.black)
                                .bold()
                                .padding()
                            }
                        
                        }
                    }
                    .frame(height: 630)
                    .scrollIndicators(.hidden)
                    .background(Color.black.opacity(0.4))
                    .offset(y: 40)
                }
                
            }
        }
    }
}
#Preview {
    Ressortsuche()
        .environmentObject(UserViewModel())
        .environmentObject(RessortViewModel())
        .environmentObject(SnowApiViewModel())
        .environmentObject(HomeViewModel())
}
