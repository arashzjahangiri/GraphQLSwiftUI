//
//  ToDoViewModel.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 11.07.21.
//

import Foundation
import SwiftUI

class ToDoViewModel: ObservableObject {
    @ObservedObject private var apiManager: APIManager
    @Published var toDoList = [ToDoModel]()
    
    init() {
        apiManager = APIManager.shared
        apiManager.createDelegate = self
    }
    
    func getToDoList() {
        if toDoList.count > 0 {
            return
        }
        apiManager.getToDoList { [weak self] list, error in
            if error == nil {
                if let todos = list {
                    self?.toDoList = todos
                }
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func updateItem(id: Int) {
        var status: Bool = false
        for index in 0..<toDoList.count {
            if toDoList[index].id == id {
                status = !(toDoList[index].status ?? false)
                toDoList[index].status = status
            }
        }
        
        apiManager.updateToDo(id: id, status: status) { [weak self] statusResponse, error  in
            if error != nil {
                self?.rollback(for: id, status: !status)
            }
        }
    }
    
    private func rollback(for id: Int, status: Bool) {
        for index in 0..<toDoList.count {
            if toDoList[index].id == id {
                toDoList[index].status = status
            }
        }
    }
}

extension ToDoViewModel: APIManagerCreateProtocol {
    func new(item: ToDoModel) {
        toDoList.append(item)
    }
}
