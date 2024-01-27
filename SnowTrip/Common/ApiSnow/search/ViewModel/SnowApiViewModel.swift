//
//  SnowApiViewModel.swift
//  SnowTrip
//
//  Created by Max Brockauf on 26.01.24.
//

import Foundation

class SnowApiViewModel: ObservableObject {
    
    @Published var searchString = ""
    
    init(){
        fetchData()
    }
    
    @Published var news = [Item]()
    
    func fetchData() {
        Task {
            do {
                self.news = try await Searchrepo.fetchresort(searchString: searchString)
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
