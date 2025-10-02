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
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text("Show the new view!")
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
        }
        
    }
}

#Preview {
    ToDoListView()
}
