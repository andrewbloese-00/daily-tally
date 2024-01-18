//
//  CounterHistoryView.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/17/24.
//

import SwiftUI
import SwiftData
import Charts
struct CounterHistoryView: View {
    
    //TODO: Initialize state to start / end of current week
    @State var chartStart = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date()) ?? Date()
    @State var chartEnd = Date()
    @State var counter:DailyCounter
    @Environment(\.modelContext) var context
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(counter.name)")
                    .font(.title)
                    .foregroundColor(colors[counter.color])

                Chart {
                    ForEach(counter.getChartDayData(
                        from: chartStart,
                            to: chartEnd)
                    ){
                        BarMark(
                            x: .value("Date",$0.date),
                            y: .value("\(counter.name)", $0.tallyCount)
                        )
                    }
                }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        
        
        
        
    }
}

#Preview {
    let previewCounter = DailyCounter(name:"Test",color:1)
    return CounterHistoryView(counter:previewCounter)
        .modelContainer(for:[DailyCounter.self])
}



//func getWeekStart(from:Date)->Date{
//    
//}
//
//func getWeekend(from:Date)->Date {
//    
//}
