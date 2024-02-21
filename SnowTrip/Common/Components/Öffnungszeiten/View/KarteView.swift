//
//  KarteView.swift
//  SnowTrip
//
//  Created by Max Brockauf on 12.02.24.
//

import SwiftUI

struct KarteView: View {
    @EnvironmentObject private var snowviewmodel : SnowApiViewModel
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = CGSize.zero
    
    var id : String
    
    func resetImageState() {
        
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
            
        }
    }
    
    var body: some View {
        ZStack{
            ForEach(snowviewmodel.ressortbyid,id: \.resortName){re in
                AsyncImage(url: URL(string: "https://www.snow-country.com/trail_maps/large_trail_maps/\(re.id ?? "").jpg")){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .shadow(color: .black.opacity(0.2), radius: 12, x:2, y: 2)
                        .opacity(isAnimating ? 1: 0)
                        .animation(.linear(duration: 1), value: isAnimating)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .scaleEffect(imageScale)
                        .onTapGesture(count: 2) {
                            if imageScale == 1 {
                                withAnimation(.spring()){
                                    imageScale = 5
                                    
                                }
                            }else{
                                resetImageState()
                                
                            }
                        }
                        .gesture(DragGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)){
                                    if imageScale <= 1  {
                                        imageOffset = value.translation
                                    }else{
                                        imageOffset = value.translation
                                        
                                    }
                                    
                                    
                                }
                            }
                            .onEnded{ value in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                                
                                
                            }
                        )
                        .gesture(
                            MagnificationGesture()
                                .onChanged{ value in
                                    withAnimation(.linear(duration: 1)){
                                        if imageScale >= 1 && imageScale <= 5 {
                                            imageScale = value
                                        } else if imageScale > 5 {
                                            imageScale = 5
                                        }
                                    }
                                }
                                .onEnded{ _ in
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    } else if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            
                            
                        )
                }placeholder: {
                    ProgressView()
                        .padding()
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 1)){
                isAnimating = true
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




#Preview {
    KarteView(id: "612002" )
        .environmentObject(SnowApiViewModel())
}
