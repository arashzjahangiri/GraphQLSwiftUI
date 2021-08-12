//
//  AddToDoViewModel.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 12.07.21.
//

import Foundation

protocol AddToDoViewModelProtocol {
    func createToDo(title: String, description: String)
}

final class AddToDoViewModel: ObservableObject, AddToDoViewModelProtocol {
    @Published var toDoCreated: Bool = false
    internal var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol) {
        self.apiManager = apiManager
    }
    
    func createToDo(title: String, description: String) {
        apiManager.createToDo(title: title, description: description) { [weak self] responseModel, error in
            if error == nil {
                self?.toDoCreated = true
            }
        }
    }
}

extension AddToDoViewModel {
    static func factory() -> AddToDoViewModel {
        return AddToDoViewModel(apiManager: APIManager.shared)
    }
}
