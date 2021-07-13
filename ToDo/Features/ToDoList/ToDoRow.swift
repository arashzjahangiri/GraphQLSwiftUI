//
//  ToDoRow.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 11.07.21.
//

import SwiftUI

struct ToDoRow: View {
    var model: ToDoModel
    
    var body: some View {
        return VStack(alignment: .leading) {
            if model.status == false {
                Text(model.title ?? "")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(model.description ?? "")
                    .italic()
            } else {
                Text(model.title ?? "")
                    .font(.title)
                    .strikethrough(true, color: .gray)
                    .italic()
                Text(model.description ?? "")
                    .italic()
            }
            
        }
    }
}
