//
//  MyBuddys.swift
//  SnowTrip
//
//  Created by Max Brockauf on 07.02.24.
//
import CoreLocation
import MapKit
import SwiftUI

struct MyBuddys: View {
    @State private var selection: UUID?
    @StateObject private var myBuddyViewModel = MyBuddysViewModel()
    let locationManager = CLLocationManager()
    
    
     let myFavoriteLocations = [
         MyFavoriteLocation(name: "Empire state building", coordinate: .empireStateBuilding),
         MyFavoriteLocation(name: "Columbia University", coordinate: .columbiaUniversity),
         MyFavoriteLocation(name: "Weequahic Park", coordinate: .weequahicPark)]
    
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 51.3406321,longitude: 12.3747329),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    
    @State private var mapType: MapStyle = .standard
    @State private var colorstate : Color = .green
    @State private var but : Bool = false
    
    @State private var showingCredits = false

    let heights = stride(from: 0.2, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    

    var body: some View {
        ZStack{
            
            VStack{
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .tint(myBuddyViewModel.statusinttocolor())
                    .mapStyle(mapType)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        locationManager.requestWhenInUseAuthorization()
                    }
        
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action: {
                        but.toggle()
                    }, label: {
                        Image(systemName:  "globe.americas.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                    if but {
                        HStack{
                            Button(action: {
                                mapType = .standard
                            }, label: {
                                Text("Standard")
                                    .clipShape(.rect)
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            })
                            Button(action: {
                                mapType = .hybrid
                            }, label: {
                                Text("Hybrid")
                                    .clipShape(.rect)
                                    .padding(5)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            })
                            
                        }
                    }
                }
                if !but {
                    Divider()
                        .frame(width: 50)
                    Button(action: {
                        showingCredits.toggle()
                    }, label: {
                        Image(systemName: "arrow.up.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                    })
                    .sheet(isPresented: $showingCredits) {
                        StatusView()
                            .environmentObject(myBuddyViewModel)
                            .presentationDetents(Set(heights))
                            .presentationBackgroundInteraction(.enabled)
                    }
                }
                
            
            }
            
                .padding(5)
                .clipShape(Rectangle())
                .background(.black)
                .cornerRadius(10)
                .foregroundColor(.gray)
                .offset(x: but ? -71 : -150, y: -330)
            
            if myBuddyViewModel.status == 3 {
                NofallView()
                    .environmentObject(myBuddyViewModel)

            }
        }
    }
}

#Preview {
    MyBuddys()
}

struct MyFavoriteLocation: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    static func == (lhs: MyFavoriteLocation, rhs: MyFavoriteLocation) -> Bool {
        return lhs.id == rhs.id
    }
}

extension CLLocationCoordinate2D {
    static let weequahicPark = CLLocationCoordinate2D(latitude: 40.7063, longitude: -74.1973)
    static let empireStateBuilding = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
    static let columbiaUniversity = CLLocationCoordinate2D(latitude: 40.8075, longitude: -73.9626)
}
