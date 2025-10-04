//
//  ToDo.swift
//  ToDoList
//
//  Created by Tony van de Ven on 10/3/25.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Date.now + 60*60*24
    var notes: String = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + 60*60*24, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
    
}
extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //Add mock container
        container.mainContext.insert(ToDo(item: "Do assignment for swift app", reminderIsOn: true, dueDate:Date.now + 60*60*24 , notes: "A single page change is requiredf", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Book Ticket to HK", reminderIsOn: true, dueDate:Date.now + 60*60*12 , notes: "Low cost flight", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Book Bus ticket to Airport", reminderIsOn: true, dueDate:Date.now + 60*60*24*2 , notes: "BKK required", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Book Mum mand Dad's trip", reminderIsOn: true, dueDate:Date.now + 60*60*24 , notes: "Arround 19 Dec", isCompleted: false))
        
        return container
    }
}
