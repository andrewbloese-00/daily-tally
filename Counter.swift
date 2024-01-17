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
    init(name:String="", color:Int=0){
        self.name = name
        self.color = color
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
 
    
    
    
    
    
    
}
     
