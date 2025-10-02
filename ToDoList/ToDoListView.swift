//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Tony van de Ven on 10/2/25.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        DetailView()
                    } label: {
                        Text("Winter")
                    }
                    Text("Summer")
                } header: {
                    Text("Breaks")
                }


                Section {
                    Text("Spring")
                    Text("Autumn")
                } header: {
                    Text("Semesters")
                }
                
            }
            .navigationTitle(Text("School Year"))
            .listStyle(.inset)
        }
        
    }
}

#Preview {
    ToDoListView()
}
