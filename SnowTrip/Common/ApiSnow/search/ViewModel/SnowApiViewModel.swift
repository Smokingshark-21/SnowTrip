//
//  SnowApiViewModel.swift
//  SnowTrip
//
//  Created by Max Brockauf on 26.01.24.
//

import Foundation
@MainActor
class SnowApiViewModel: ObservableObject {
    @Published var searchString = ""
    
    init(){
        fetchDataRegion()
    }
    
    @Published var items = [Items]()
    @Published var ressortbyid = [Ressort]()
    
    func fetchDataRegion() {
        Task {
            do {
                self.items = try await Searchrepo.fetchregion(searchString: searchString)
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    func fetchDataById(id: String) async {
        Task {
            do {
                self.ressortbyid = try await Searchrepo.fetchResortById(id: id)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
