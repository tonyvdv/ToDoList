//
//  DetailView.swift
//  ToDoList
//
//  Created by Tony van de Ven on 10/2/25.
//

import SwiftUI

struct DetailView: View {
    
    var passedValue: String
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You are a Swifty Legend!\n And you passed over the value: \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Go Back"){
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    DetailView(passedValue: "Item xx")
}
