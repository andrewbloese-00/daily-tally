//
//  CreateCategoryView.swift
//  DailyTally Watch App
//
//  Created by Andrew Bloese on 1/14/24.
//

import SwiftUI

struct CreateCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State private var counter = DailyCounter()
    
    var body: some View {
        
        Text("New Counter").font(.headline)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
            .frame(width: 160, alignment: .leading)
            VStack() {
                TextField("Counter Name",text:$counter.name)
                Picker("Color", selection: $counter.color , content: {
                    Circle()
                        .fill(.red)
                        .frame(width: 20)
                        .tag(0)
                    
                    Circle()
                        .fill(.blue)
                        .frame(width: 20)
                        .tag(1)
                    
                    Circle()
                        .fill(.green)
                        .frame(width: 20)
                        .tag(2)
                    
                    Circle()
                        .fill(.purple)
                        .frame(width: 20)
                        .tag(3)
                    Circle()
                        .fill(.yellow)
                        .frame(width: 20)
                        .tag(4)
                }).frame(width: .infinity, height: 50)
                
                Button("Create") {
                    withAnimation {
                        context.insert(counter)
                    }
                    dismiss()
                }
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
            

        

    }
}

#Preview {
    CreateCategoryView()
        .modelContainer(for:DailyCounter.self)
}
