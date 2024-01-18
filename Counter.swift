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
    
    //generate data that conforms to Swift Charts formatting for the CounterHistory view
    //gets the number of tallies on each day in the date interval [from,to]
    func getChartDayData(from:Date,to:Date)->[ViewTallies]{
        //store the date and number tallies for each day in the range 'from' to 'to'
        var ans:[ViewTallies] = []
        var curr:Date = from
        var attempts = 0
        let cal = Calendar.current
        //while within the date range, the user can look at at most 1 year of days at a time
        while curr <= to && attempts < 365 {
            //create a datapoint for the tallies on the day and add to our dataset
            ans.append(ViewTallies(
                timestamp: curr,
                tallyCount: self.numTallies(on: curr)
            ))
            curr = cal.date(byAdding: .day, value: 1, to: curr) ?? curr
            attempts+=1
        }
        return ans
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



