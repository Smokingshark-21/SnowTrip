//
//  HomeViewModel.swift
//  SnowTrip
//
//  Created by Max Brockauf on 25.01.24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var widgetlist: [Widget] = []
    
    func monatssprüche() -> String {
        let date = Date()
        let calender = Calendar.current
        let month = calender.component(.month, from: date)
        
        switch month {
        case 1:
            return     "Frische Spuren im neuen Jahr – lass uns den Schnee erobern!"
        case 2:
            return     "Liebe ist wie frischer Pulverschnee – umso besser, wenn man sie teilen kann."
        case 3:
            return     "Wenn der Winter nachlässt, sind die besten Abfahrten oft die letzten."
        case 4:
            return     "Auch wenn der Frühling naht, gibt es auf dem Board noch viele Schneeabenteuer."
        case 5:
            return     "Blumen blühen, aber auf dem Snowboard blüht die Freiheit."
        case 6:
            return     "Sommerhitze kann uns nicht stoppen – suchen wir nach Gletscherabenteuern."
        case 7:
            return     "Auf dem Board tanzen wir im Sommer auf verschneiten Gipfeln."
        case 8:
            return     "Sommerpause? Nicht für Snowboarder – wir träumen von Winterwundern."
        case 9:
            return     "Wenn der Herbstwind weht, erinnert er uns an die kommenden Schneestürme."
        case 10:
            return     "Die Blätter fallen, aber auf dem Snowboard steigen wir auf."
        case 11:
            return     "Vorfreude auf die Saison – der Winter legt seine weiße Decke aus."
        case 12:
            return     "Die festliche Jahreszeit beginnt, und wir starten unsere Schnee-Abenteuer."
            
        default:
            return ""
        }
        
        
    }
    func addwidget(wid : Widget) {
        if widgetlist.isEmpty {
               widgetlist = [wid]
           } else if let index = widgetlist.firstIndex(where: { $0.id == wid.id }) {
               widgetlist[index] = wid
           } else {
               widgetlist.append(wid)
           }
    }
    
    func removewidget(wid: String) {
        if let index = widgetlist.firstIndex(where: { $0.id == wid }) {
            widgetlist.remove(at: index)
        }
    }
    
    func tageszeit(name:String) -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if (hour >= 6 && hour < 12) {
            return "Guten Morgen \(name)"
        } else if (hour >= 12 && hour < 18) {
            return "Guten Tag \(name)"
        } else {
            return "Guten Abend \(name)"
        }
    }
}
