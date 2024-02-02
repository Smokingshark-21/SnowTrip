//
//  SearchRepo.swift
//  SnowTrip
//
//  Created by Max Brockauf on 26.01.24.
//

import Foundation
class Searchrepo {
    
    static func  fetchregion (searchString : String)async throws -> [Items]{
        var urlString = ""
        
        if searchString.isEmpty{
            urlString = "https://feeds.snocountry.net/getResortList.php?apiKey=SnoCountry.example&regions=usa&output=json"
        }
        else {
            urlString = "https://feeds.snocountry.net/getResortList.php?apiKey=SnoCountry.example&regions=\(searchString)&output=json"
        }
        
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        print(url)
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(regioresponse.self, from: data).items
    }
    
    
    static func  fetchResortById (id : String)async throws -> [Ressort]{
        let urlString = "https://feeds.snocountry.net/getSnowReport.php?apiKey=SnoCountry.example&ids=\(id)"
        
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        print(url)
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Idresponse.self, from: data)
        let ressort = response.items.map { ressort in
            var newressort = ressort
            newressort.logo = ressort.logo.replacingOccurrences(of: "http://", with: "https://")
            return newressort
        }
        return ressort
    }
}
