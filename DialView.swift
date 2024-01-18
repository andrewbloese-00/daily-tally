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
    @Environment(\.modelContext) var context
    @State var counter:DailyCounter
    var body: some View {
        NavigationView{
            VStack {
//                Text("\(counter.name) Today")
                ZStack{
                    //PM Dial Track
                    Circle()
                        .fill(.background)
                        .stroke(.white)
                        .frame(width: PM_WIDTH)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .opacity(0.2)
                    
                    //AM Dial Track
                    Circle()
                        .fill(.background)
                        .stroke(.white)
                        .opacity(0.2)
                        .frame(width: AM_WIDTH)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    
                    //counter button
                    Button(
                        action: {
                            
            
                            withAnimation{
                                let now = Date()
                                counter.tallies.append(Tally(timestamp: now))
                                counter.last_interacted = now
                            }
                        },
                        label: {
                            Text("\(counter.numTallies(on: Date()))")
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
                            .rotation(.degrees(-90))
                            .stroke(colors[counter.color],lineWidth:5)
                            .frame(width: $0.ring == 0 ? AM_WIDTH : PM_WIDTH)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            .opacity(0.8)
                    }
                    
                    
                }.frame(width: .infinity,height: .infinity,alignment: .center)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                NavigationLink(destination: {}) {
                    Label("History",systemImage: "calendar")
                }
            }
        }
        
    }
}
#Preview {
    let counter = DailyCounter(name:"Nicotine")
    counter.color = 1
    counter.tallies.append(Tally(timestamp: Date()))
    return DialView(counter: counter)
}
