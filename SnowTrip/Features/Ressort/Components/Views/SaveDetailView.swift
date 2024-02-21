//
//  SaveDetailView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 12.02.24.
//

import SwiftUI

struct SaveDetailView: View {
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    @EnvironmentObject private var homeviewmodel : HomeViewModel
    @EnvironmentObject private var userviewmodel : UserViewModel
    @EnvironmentObject private var ressortviewmodel : RessortViewModel
    var name : String
   @State var status = false
   @State var offnung = false
   @State var tiefe = false
   @State var karte = false
    var id : String
    var body: some View {
        NavigationStack{
            List{
                offnungszeiten(id: id )
                    .environmentObject(snowviewmodel)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .swipeActions{
                        Button(action: {
                            offnung.toggle()
                        }, label: {
                            if offnung {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .background(Color.red)
                                
                            }else{
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .background(Color.green)
                            }
                        })
                    }
                    .onChange(of: offnung){
                        homeviewmodel.addwidget(wid: Widget(name: name, status: status, offnung: offnung, karte: karte, schnetiefe: tiefe, id: id))
                        
                        userviewmodel.saveRessort(with: ressortviewmodel.resortlist, widget: homeviewmodel.widgetlist)
                    }
                SchneeMinMaxView(id: id)
                    .environmentObject(snowviewmodel)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                
                    .swipeActions{
                        Button(action: {
                            tiefe.toggle()
                        }, label: {
                            if tiefe {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .background(Color.red)
                                
                            }else{
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .background(Color.green)
                            }
                        })
                    }
                    .onChange(of: tiefe){
                        homeviewmodel.addwidget(wid: Widget(name: name, status: status, offnung: offnung, karte: karte, schnetiefe: tiefe, id: id))
                        
                        userviewmodel.saveRessort(with: ressortviewmodel.resortlist, widget: homeviewmodel.widgetlist)
                    }
                
                KarteView(id: id)
                    .environmentObject(snowviewmodel)
                    .padding()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                
                    .swipeActions{
                        Button(action: {
                            karte.toggle()
                        }, label: {
                            if karte {
                                Image(systemName: "minus.circle")
                                    .resizable()
                                    .background(Color.red)
                                
                            }else{
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .background(Color.green)
                            }
                        })
                    }
                    .onChange(of: karte){
                        homeviewmodel.addwidget(wid: Widget(name: name, status: status, offnung: offnung, karte: karte, schnetiefe: tiefe, id: id))
                        
                        userviewmodel.saveRessort(with: ressortviewmodel.resortlist, widget: homeviewmodel.widgetlist)
                    }
            }
            
            .frame(width: 450)
            .listStyle(SidebarListStyle())
        }
        .navigationTitle(name)
    }
}

#Preview {
    SaveDetailView(name: "test", id: "509001" )
        .environmentObject(SnowApiViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(RessortViewModel())
}
