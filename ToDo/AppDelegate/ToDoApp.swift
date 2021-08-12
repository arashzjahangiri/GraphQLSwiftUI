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
            let apiManager = APIManager.shared
            let viewModel = ToDoViewModel(apiManager: apiManager)
            ToDoListView(viewModel: viewModel)
        }
    }
}
