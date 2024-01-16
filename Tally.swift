//
//  Tally.swift
//  DailyTally Watch App
//
//  Description - swift data model for the "Tally" entries that the user can save
//  calculates the swift UI circle trim on creation, has a name for sorting and
//  timestamp for filtering
//
//  Created by Andrew Bloese on 1/13/24.
//

import Foundation




func getHours(date:Date)->Int {
    return Calendar.current.component(.hour, from: date)
}

func getMinutes(date:Date)->Int {
    return Calendar.current.component(.minute, from: date)
}

//calculate arc position 0.0 -> 1.0
func determineTrim(_ timestamp:Date)->Float {
    let hours = getHours(date: timestamp)
    let minutes = getMinutes(date: timestamp)
    let angle = Float(((hours % 12) * 30) + ( minutes / 2))
    return (angle/360.0)
}




struct Tally:Codable,Identifiable {
    var id: UUID
    var timestamp:Date
    var trim_start:Float = 0.0
    var trim_stop:Float = 0.1
    var color:Int = 0
    var ring:Int = 0
    
    init(timestamp: Date=Date() ) {
        self.id = UUID()
        let trim_bounds = determineTrim(timestamp)
        self.timestamp = timestamp
        self.trim_start = trim_bounds
        self.trim_stop = trim_bounds+0.01
        let hour = Calendar.current.component(.hour, from: timestamp)
        self.ring = hour >= 12 ? 1 : 0
        
    }

    
}



