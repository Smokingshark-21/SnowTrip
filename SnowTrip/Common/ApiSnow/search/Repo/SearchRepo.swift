//
//  SearchRepo.swift
//  SnowTrip
//
//  Created by Max Brockauf on 26.01.24.
//

import Foundation

class Searchrepo {
    
    static func  fetchresort (searchString : String)async throws -> [Item]{
        var urlString = ""
        
        if searchString.isEmpty{
            urlString = "http://feeds.snocountry.net/getResortList.php?apiKey=SnoCountry.example&regions=usa&output=json"
        }
        else {
            urlString = "http://feeds.snocountry.net/getResortList.php?apiKey=SnoCountry.example&regions=\(searchString)&output=json"
        }
        
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        print(url)
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(searchresponse.self, from: data).items
    }
}
