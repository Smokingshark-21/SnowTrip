//
//  GespeicherteRessort.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import SwiftUI

struct GespeicherteRessort: View {
    @EnvironmentObject private var ressortviewmodel : RessortViewModel
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    @EnvironmentObject private var homeviewmodel : HomeViewModel
    @EnvironmentObject private var userviewmodel : UserViewModel
    var body: some View {
        NavigationStack{
            ZStack{
                Image("LoginRegister")
                    .resizable()
                    .ignoresSafeArea()
                    .blur(radius: 3.0)
                
                List{
                    ForEach(ressortviewmodel.resortlist,id: \.self){re in
                        VStack{
                            Text(re.resortName ?? "")
                                .foregroundColor(.white.opacity(0.9))
                            
                            
                            Text(re.state ?? "")
                                .foregroundColor(.gray)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            
                            NavigationLink ("", destination: SaveDetailView(name: re.resortName ?? "", id: re.id ?? ""))
                                .environmentObject(snowviewmodel)
                                .environmentObject(userviewmodel)
                                .environmentObject(homeviewmodel)
                                .environmentObject(ressortviewmodel)

                        }
                        .swipeActions{
                            Button(role: .none) {
                                if let index = homeviewmodel.widgetlist.firstIndex(where: { $0.id == re.id }) {
                                        homeviewmodel.widgetlist.remove(at: index)
                                    }else {
                                        homeviewmodel.addwidget(wid: Widget(name: re.resortName ?? "", status: true, offnung: true, karte: true, schnetiefe: true, id: re.id ?? ""))
                                    }
                                userviewmodel.saveRessort(with: ressortviewmodel.resortlist, widget: homeviewmodel.widgetlist)
                            } label: {
                                if let index = homeviewmodel.widgetlist.firstIndex(where: { $0.id == re.id }) {
                                    Label("removeAll",systemImage: "minus.circle")
                                }else {
                                    Label("addAll",systemImage: "plus.circle")
                                }
                            }

                            Button(role: .destructive) {
                                if let index = ressortviewmodel.resortlist.firstIndex(where: { $0.id == re.id }) {
                                    ressortviewmodel.resortlist.remove(at: index)
                                }
                                homeviewmodel.removewidget(wid: re.id ?? "")

                                userviewmodel.saveRessort(with: ressortviewmodel.resortlist, widget: homeviewmodel.widgetlist)
                                
                            }label: {
                                Label("löschen",systemImage: "trash")
                            }
                            
                        }
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    GespeicherteRessort()
        .environmentObject(RessortViewModel())
        .environmentObject(SnowApiViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
}
