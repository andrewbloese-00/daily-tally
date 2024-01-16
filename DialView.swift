//
//  DialView.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/15/24.
//

import SwiftUI

let PM_WIDTH = 300.0
let AM_WIDTH = 90.0

struct DialView: View {
    @State var counter:DailyCounter
    var body: some View {
        VStack {
            
            Text("\(counter.name) Today")
            ZStack{
                //PM Dial Track
                Circle()
                    .fill(.background)
                    .stroke(.white)
                    .frame(width: PM_WIDTH)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .opacity(0.4)
                
                //AM Dial Track
                Circle()
                    .fill(.background)
                    .stroke(.white)
                    .opacity(0.5)
                    .frame(width: AM_WIDTH)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                //counter button
//                Circle()
//                    .fill(colors[counter.color])
//                    .frame(width: 30)
                
                Button(
                    action: {
                        counter.tallies.append(Tally(timestamp: Date()))
                    },
                    label: {
                        Text("\(counter.tallies(on: Date()).count)")
                            .frame(width: 30,height: 30)
                            .background(colors[counter.color])
                            .clipShape(Circle())
                    }
                ).frame(width: 30,height: 30)
                    .background(colors[counter.color])
                    .clipShape(Circle())
                   
                
                
                
                //TODO: Insert the puffs from today
                ForEach(counter.tallies(on: Date())){
                    Circle()
                        .trim(
                            from: CGFloat($0.trim_start),
                            to: CGFloat($0.trim_stop)
                        )
                        .stroke(colors[counter.color],lineWidth:5)
                        .frame(width: $0.ring == 0 ? AM_WIDTH : PM_WIDTH)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                }
                    
                
            }.frame(width: .infinity,height: .infinity,alignment: .center)
        }

    }
}

#Preview {
    let counter = DailyCounter(name:"Nicotine")
    counter.color = 1
    counter.tallies.append(Tally(timestamp: Date()))
    return DialView(counter: counter)
}
