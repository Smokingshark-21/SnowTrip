//
//  Idresponse.swift
//  SnowTrip
//
//  Created by Max Brockauf on 29.01.24.
//

import Foundation

struct Idresponse : Codable{
    let items : [Ressort]
}
struct Ressort : Codable, Hashable {
    
    let id: String?
    let resortName: String?
    let state: String?
    let country: String?
    let reportDateTime: String?
    let resortStatus: String?
    let operatingStatus: String?
    let resortType: String?
    let primarySurfaceCondition: String?
    let newSnowMin: String?
    let newSnowMax: String?
    let snowLast48Hours: String?
    let snowComments: String?
    let avgBaseDepthMin: String?
    let avgBaseDepthMax: String?
    let openDownHillTrails: String?
    let openDownHillLifts: String?
    let openDownHillMiles: String?
    let openDownHillAcres: String?
    let openDownHillPercent: String?
    let nightSkiing: String?
    let weekendHours: String?
    let weekdayHours: String?
    let maxOpenDownHillTrails: String?
    let maxOpenDownHillMiles: String?
    let maxOpenDownHillAcres: String?
    let maxOpenDownHillLifts: String?
    let terrainParkOpen: String?
    let terrainParkLocation: String?
    let numberTerrainParksOpen: String?
    let numberTerrainParkFeatures: String?
    let covidMaskRequired: String?
    let covidUpdatedOn: String?
    let covidSocialDistancingRequired: String?
    let covidSanitizationStationsAvailable: String?
    let covidPassProtection: String?
    let covidReservationsRequired: String?
    let covidPrePurchaseDayLiftTicketsRecommended: String?
    let resortCovidPage: String?
    let covidPassProtectionPage: String?
    let covidReservationsRequiredPage: String?
    let weatherToday_Condition: String?
    let weatherTomorrow_Condition: String?
    let weatherDayAfterTomorrow_Condition: String?
    let weatherDay4_Condition: String?
    let weatherDay5_Condition: String?
    let weatherToday_WindDirection: String?
    let weatherTomorrow_WindDirection: String?
    let weatherDayAfterTomorrow_WindDirection: String?
    let weatherDay4_WindDirection: String?
    let weatherDay5_WindDirection: String?
    let SnoCountryResortLink: String?
    let tnTrailMapURL: URL
    let lgTrailMapURL: URL
    let logo: URL
    let timezone: String?
    let resortAddress: String?
    let maxXCSkiTrails: String?
}
