//
//  Counter.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/13/24.


import Foundation
import SwiftData


//The following model will use the Tally struct with SwiftData 

@Model
class DailyCounter{
    var name:String = "daily counter"
    var tallies:[Tally] = []
    var color = 0
    var last_interacted:Date
    init(name:String="", color:Int=0){
        self.name = name
        self.color = color
        self.last_interacted = Date()
    }
    
    
    func tallies(on:Date)->[Tally]{
        var res:[Tally] = []
        for tally in tallies {
            if Calendar.current.isDate(on, inSameDayAs: tally.timestamp) {
                res.append(tally)
            }
        }
        return res;
    }
    
    func numTallies(on:Date)->Int {
        return self.tallies(on: on).count;
    }
    
    
 
    
    
    
    
    
    
}
     

func toLabelDate(timestamp:Date)->Date{
    let m = Calendar.current.component(.month, from: timestamp)
    let d = Calendar.current.component(.day, from: timestamp)
    let y = Calendar.current.component(.year, from: timestamp)
    let components = DateComponents(year:y, month:m, day: d)
    return Calendar.current.date(from:components) ?? Date()
}



struct ViewTallies:Identifiable {
    let id = UUID()
    var date:Date
    var tallyCount:Int
    init(timestamp:Date, tallyCount:Int){
        self.date = toLabelDate(timestamp: timestamp)
        self.tallyCount = tallyCount
    }
}



