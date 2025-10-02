//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Tony van de Ven on 10/2/25.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Buy milk",
                 "Learn SwiftUI",
                 "Go for a walk",
                 "Build a spaceship",
                 "Bring the Awesome",
                 "Take a Vacation"]
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }

                   
                }
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        
    }
}

#Preview {
    ToDoListView()
}
