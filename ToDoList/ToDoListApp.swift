//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Tony van de Ven on 10/2/25.
//

import SwiftUI
import SwiftData


@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    //run location of data
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
