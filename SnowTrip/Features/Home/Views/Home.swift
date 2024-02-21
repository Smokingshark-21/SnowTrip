//
//  Home.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var homeViewmodel: HomeViewModel
    @EnvironmentObject private var snowViewModel: SnowApiViewModel
    @EnvironmentObject private var ressortviewmodel : RessortViewModel
    @State var aus = ""
    var body: some View {
        ZStack{
            
            Image("LoginRegister")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 3.0)
            
            ScrollView{
                
                Header()
                    .environmentObject(userViewModel)
                    .environmentObject(homeViewmodel)
                
                Picker("", selection: $aus) {
                    ForEach(homeViewmodel.widgetlist, id: \.name) { re in
                        Text(re.name).tag(re.name)
                    }
                }
                .foregroundColor(.black)
                .pickerStyle(.palette)
                
                ForEach(homeViewmodel.widgetlist) { re in
                    if re.name == aus {
                        VStack {
                            if re.offnung {
                                offnungszeiten(id: re.id)
                            }
                            if re.schnetiefe {
                                SchneeMinMaxView(id: re.id)
                            }
                            if re.karte {
                                KarteView(id: re.id)
                                
                            }
                        }
                    }
                }
                
            }
            .scrollIndicators(.hidden)
            
        }
        .onAppear{
            if ressortviewmodel.resortlist.isEmpty{
                ressortviewmodel.resortlist = userViewModel.user?.savedressort ?? []
            }
            if homeViewmodel.widgetlist.isEmpty{
                homeViewmodel.widgetlist =
                userViewModel.user?.widgets ?? []
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(UserViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(SnowApiViewModel())
        .environmentObject(RessortViewModel())
}
