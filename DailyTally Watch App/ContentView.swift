//
//  ContentView.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/13/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @State var showCreate = false
    @State var viewingDate = Date()
    @Query(sort:\DailyCounter.name) var counters:[DailyCounter]
    
    var body: some View {
        NavigationStack {
            List {
                if(!counters.isEmpty){
                    ForEach(counters, content: {
                        DailyCounterView(counter: $0)
                    })
                } else {
                    Text("No Counters Created")
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            showCreate.toggle()
                        },
                        label: {
                            Label("New Counter", systemImage: "plus")
                                .foregroundColor(.blue)
                        }
                    )
                }
            }
            .sheet(isPresented: $showCreate, content: {
                NavigationStack {
                    CreateCategoryView()
                }
                .presentationDetents([.large])
            })
            
        }
        
    }
}

#Preview {
    ContentView().modelContainer(for: [DailyCounter.self])
}
