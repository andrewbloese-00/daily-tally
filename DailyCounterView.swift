//
//  DailyCounterView.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/13/24.
//

import SwiftUI


let colors:[Color] = [ Color.red , Color.blue, Color.green, Color.purple, Color.yellow ]

struct DailyCounterView: View {
    
    var counter:DailyCounter
    var viewDate:Date = Date()
    
    var body: some View {
        NavigationLink(destination: DialView(counter: counter), label: {
            HStack(alignment: .center, content: {
                Text("\(counter.name)")
                    .font(.title3)
                Spacer()
                ZStack {
                    Circle()
                        .fill(colors[counter.color])
                        .frame(width: 30)
                    Text("\(counter.tallies(on: viewDate).count)")
                }
            })
        })
        
        
    }
}

#Preview {
    let counter = DailyCounter(name: "Puffs")
    counter.color = 0;
    counter.tallies.append(Tally(timestamp: Date()))
    return DailyCounterView(counter: counter)
}
