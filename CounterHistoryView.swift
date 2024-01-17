//
//  CounterHistoryView.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/17/24.
//

import SwiftUI
import SwiftData

struct CounterHistoryView: View {
    @State var counter:DailyCounter
    @Environment(\.modelContext) var context
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let previewCounter = DailyCounter(name:"Test",color:1)
    return CounterHistoryView(counter:previewCounter)
        .modelContainer(for:[DailyCounter.self])
}
