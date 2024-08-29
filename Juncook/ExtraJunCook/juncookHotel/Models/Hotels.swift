//
//  Hotels.swift
//  Juncook
//
//  Created by Nguyen Ngoc Tuyen on 12/8/24.
//

import Foundation
import SwiftUI

enum Hotels: String, CaseIterable {
    case bellagio
    case fairmontmaged
    case raffles
    case theritz
    
    var displayName: String {
        switch self {
        case .bellagio:
            return "bellagio"
        case .fairmontmaged:
            return "a Fairmont Managed"
        case .raffles:
            return "Raffles"
        case .theritz:
            return "The Ritz"
        }
    }
    
    var locationName: String {
        switch self {
        case .bellagio:
            return "Las Vegas - USA"
        case .fairmontmaged:
            return "New York  - USA"
        case .raffles:
            return "Singapore"
        case .theritz:
            return "London - UK"
        }
    }
    
    var imageName: String {
        switch self {
        case .bellagio:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/8a/e0/b9/bellagio-las-vegas.jpg?w=200&h=-1&s=1"
        case .fairmontmaged:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/02/03/76/the-plaza-hotel.jpg?w=1200&h=-1&s=1"
        case .raffles:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/0c/0b/be/paramount-hotel-times.jpg?w=1000&h=-1&s=1"
        case .theritz:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/db/ef/9e/photo0jpg.jpg?w=1400&h=-1&s=1"
        }
    }
    
    var price: String {
        switch self {
        case .bellagio:
            return "$342"
        case .fairmontmaged:
            return "$250"
        case .raffles:
            return "$160"
        case .theritz:
            return "$460"
        }
    }
    
    var rate: String {
        switch self {
        case .bellagio:
            return "(4.0)"
        case .fairmontmaged:
            return "(4.2)"
        case .raffles:
            return "(4.9)"
        case .theritz:
            return "(4.6)"
        }
    }
    
    var description : String {
        switch self {
        case .bellagio:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .fairmontmaged:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .raffles:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .theritz:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        }
    }
}

enum Camp: String, CaseIterable {
    case masaimara
    case corcovado
    case yellowstone
    case haleakala
    
    var displayName: String {
        switch self {
        case .masaimara:
            return "bellagio"
        case .corcovado:
            return "a Fairmont Managed"
        case .yellowstone:
            return "Raffles"
        case .haleakala:
            return "The Ritz"
        }
    }
    
    var locationName: String {
        switch self {
        case .masaimara:
            return "Las Vegas - USA"
        case .corcovado:
            return "New York  - USA"
        case .yellowstone:
            return "Singapore"
        case .haleakala:
            return "London - UK"
        }
    }
    
    var imageName: String {
        switch self {
        case .masaimara:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/8a/e0/b9/bellagio-las-vegas.jpg?w=200&h=-1&s=1"
        case .corcovado:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/02/03/76/the-plaza-hotel.jpg?w=1200&h=-1&s=1"
        case .yellowstone:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/0c/0b/be/paramount-hotel-times.jpg?w=1000&h=-1&s=1"
        case .haleakala:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/db/ef/9e/photo0jpg.jpg?w=1400&h=-1&s=1"
        }
    }
    
    var price: String {
        switch self {
        case .masaimara:
            return "$342"
        case .corcovado:
            return "$250"
        case .yellowstone:
            return "$160"
        case .haleakala:
            return "$460"
        }
    }
    
    var rate: String {
        switch self {
        case .masaimara:
            return "(4.0)"
        case .corcovado:
            return "(4.2)"
        case .yellowstone:
            return "(4.9)"
        case .haleakala:
            return "(4.6)"
        }
    }
    
    var description : String {
        switch self {
        case .masaimara:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .corcovado:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .yellowstone:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .haleakala:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        }
    }
}



enum Ship: String, CaseIterable {
    case oasioftheseas
    case vovygeroftheseas
    case celebrityinfinity
    case nscdivina
    
    var displayName: String {
        switch self {
        case .oasioftheseas:
            return "bellagio"
        case .vovygeroftheseas:
            return "a Fairmont Managed"
        case .celebrityinfinity:
            return "Raffles"
        case .nscdivina:
            return "The Ritz"
        }
    }
    
    var locationName: String {
        switch self {
        case .oasioftheseas:
            return "Las Vegas - USA"
        case .vovygeroftheseas:
            return "New York  - USA"
        case .celebrityinfinity:
            return "Singapore"
        case .nscdivina:
            return "London - UK"
        }
    }
    
    var imageName: String {
        switch self {
        case .oasioftheseas:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/8a/e0/b9/bellagio-las-vegas.jpg?w=200&h=-1&s=1"
        case .vovygeroftheseas:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/02/03/76/the-plaza-hotel.jpg?w=1200&h=-1&s=1"
        case .celebrityinfinity:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/0c/0b/be/paramount-hotel-times.jpg?w=1000&h=-1&s=1"
        case .nscdivina:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/db/ef/9e/photo0jpg.jpg?w=1400&h=-1&s=1"
        }
    }
    
    var price: String {
        switch self {
        case .oasioftheseas:
            return "$342"
        case .vovygeroftheseas:
            return "$250"
        case .celebrityinfinity:
            return "$160"
        case .nscdivina:
            return "$460"
        }
    }
    
    var rate: String {
        switch self {
        case .oasioftheseas:
            return "(4.0)"
        case .vovygeroftheseas:
            return "(4.2)"
        case .celebrityinfinity:
            return "(4.9)"
        case .nscdivina:
            return "(4.6)"
        }
    }
    
    var description : String {
        switch self {
        case .oasioftheseas:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .vovygeroftheseas:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .celebrityinfinity:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .nscdivina:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        }
    }
}


enum Favorite: String, CaseIterable {
    case babdag
    case picodoarieiro
    case teidenationlpark
    case zugspitze
    case kjetag
    
    var displayName: String {
        switch self {
        case .babdag:
            return "bellagio"
        case .picodoarieiro:
            return "a Fairmont Managed"
        case .teidenationlpark:
            return "Raffles"
        case .zugspitze:
            return "The Ritz"
        case .kjetag:
        return "The Ritz"
      }
    }
    
    var locationName: String {
        switch self {
        case .babdag:
            return "Las Vegas - USA"
        case .picodoarieiro:
            return "New York  - USA"
        case .teidenationlpark:
            return "Singapore"
        case .zugspitze:
            return "London - UK"
        case .kjetag:
            return "London - UK"
        }
    }
    
    var imageName: String {
        switch self {
        case .babdag:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/8a/e0/b9/bellagio-las-vegas.jpg?w=200&h=-1&s=1"
        case .picodoarieiro:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/02/03/76/the-plaza-hotel.jpg?w=1200&h=-1&s=1"
        case .teidenationlpark:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/0c/0b/be/paramount-hotel-times.jpg?w=1000&h=-1&s=1"
        case .zugspitze:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/db/ef/9e/photo0jpg.jpg?w=1400&h=-1&s=1"
        case .kjetag:
            return "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/db/ef/9e/photo0jpg.jpg?w=1400&h=-1&s=1"
        }
        
    }
    
    var price: String {
        switch self {
        case .babdag:
            return "$342"
        case .picodoarieiro:
            return "$250"
        case .teidenationlpark:
            return "$160"
        case .zugspitze:
            return "$460"
        case .kjetag:
            return "$460"
        }
    }
    
    var rate: String {
        switch self {
        case .babdag:
            return "(4.0)"
        case .picodoarieiro:
            return "(4.2)"
        case .teidenationlpark:
            return "(4.9)"
        case .zugspitze:
            return "(4.6)"
        case .kjetag:
            return "(4.6)"
        }
    }
    
    var description : String {
        switch self {
        case .babdag:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .picodoarieiro:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .teidenationlpark:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .zugspitze:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        case .kjetag:
            return "The Palm Court delights many with its exceptional service and stunning decor, creating an elegant ambience that guests often praise, especially when the restaurant features festive decorations. The attentive staff and special touches stand out, although some guests have encountered inconsistent service.  While the delicacy of the cuisine receives commendable mentions, opinions are divided regarding portion sizes and the perceived value; the high cost does not always seem justified, especially when considering the food quantity. Additionally, despite the overall charm, the noise level and lack of views sometimes detract from the atmosphere."
        }
    }
}
