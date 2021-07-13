//
//  ToDoApp.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 10.07.21.
//

import SwiftUI

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView(viewModel: ToDoViewModel())
        }
    }
}
