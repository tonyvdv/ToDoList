//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Tony van de Ven on 10/2/25.
//  try to add to github

import SwiftUI
import SwiftData


struct ToDoListView: View {
    
    @Query var toDos: [ToDo]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    VStack (alignment: .leading){
                        HStack {
                            
                            Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDo.isCompleted.toggle()
                                    guard let _ = try? modelContext.save() else {
                                        print( "Failed to save Toggle changes.")
                                        return
                                    }
                                }
                            
                            NavigationLink {
                                DetailView(toDo: toDo)
                            } label: {
                                Text(toDo.item)
                            }
                            
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    modelContext.delete(toDo)
                                    guard let _ = try? modelContext.save() else {
                                        print( "Failed to save Delete changes.")
                                        return
                                        
                                    }
                                }
                            }
                        }
                        .font(.title3)
                        
                        HStack {
                            Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                                .foregroundStyle(.secondary)
                            if toDo.reminderIsOn {
                                Image(systemName: "calendar.badge.clock")
                                    .symbolRenderingMode(.multicolor)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle(Text("To Do List"))
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
                }
            }
            
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
    }
}


#Preview {
    ToDoListView()
        .modelContainer(ToDo.preview)
}
