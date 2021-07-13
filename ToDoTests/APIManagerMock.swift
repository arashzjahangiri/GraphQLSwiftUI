//
//  APIManagerMock.swift
//  ToDoTests
//
//  Created by Arash Z. Jahangiri on 13.07.21.
//

import Foundation
@testable import ToDo
@testable import Apollo

final class APolloMock: ApolloProtocol {
    var client: ApolloClient = ApolloClient(url: URL(string: "http://fakeurl.com")!)
    static let shared = Apollo()
}

struct NetworkError: Error {
    public private(set) var message = ""
}

final class APIManagerMock: APIManagerProtocol {
    var createDelegate: APIManagerCreateProtocol?
    
    var apolloClient: ApolloProtocol
    var successfulResult = true
    var requestWasCalled = false
    
    static let shared = APIManagerMock()
    init() {
        apolloClient = APolloMock.shared
    }
    
    func getToDoList(then: @escaping GetToDoListCompletionHandler) {
        requestWasCalled = true
        
        if successfulResult {
            let list = [ToDoModel(id: 1, title: "todo 1", description: "todo 1 notes", status: false),
                        ToDoModel(id: 2, title: "todo 2", description: "todo 2 notes", status: true)]
            then(list, nil)
        } else {
            let error: Error = NetworkError(message: "unable to get list")
            then(nil, error)
        }
    }
    
    func updateToDo(id: Int, status: Bool, then: @escaping UpdateToDoCompletionHandler) {
        requestWasCalled = true
        
        if successfulResult {
            then(true, nil)
        } else {
            let error: Error = NetworkError(message: "unable to find item")
            then(nil, error)
        }
        
    }
    
    func deleteToDo(id: Int, then: @escaping DeleteToDoCompletionHandler) {
        requestWasCalled = true
        
        if successfulResult {
            then(nil)
        } else {
            let error: Error = NetworkError(message: "unable to find item")
            then(error)
        }
    }
    
    func createToDo(title: String, description: String?, then: @escaping CreateToDoCompletionHandler) {
        requestWasCalled = true
        
        if successfulResult {
            let result = ToDoModel(id: 1, title: "todo 1", description: "todo 1 notes", status: false)
            then(result, nil)
        } else {
            let error: Error = NetworkError(message: "unable to create item")
            then(nil, error)
        }
    }
}
