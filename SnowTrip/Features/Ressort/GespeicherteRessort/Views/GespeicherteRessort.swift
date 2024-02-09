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
    var body: some View {
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

                    }
                    .swipeActions{
                        Button(role: .destructive) {
                            if let index = ressortviewmodel.resortlist.firstIndex(where: { $0.id == re.id }) {
                                ressortviewmodel.resortlist.remove(at: index)
                            }
                        }label: {
                            Label("löschen",systemImage: "trash")
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
}
