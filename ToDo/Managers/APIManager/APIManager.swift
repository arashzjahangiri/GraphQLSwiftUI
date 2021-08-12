//
//  Apollo.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 10.07.21.
//

import Foundation

protocol APIManagerCreateProtocol: AnyObject {
    func new(item: ToDoModel)
}

protocol APIManagerProtocol {
    typealias GetToDoListCompletionHandler = ((_ list: [ToDoModel]?, _ error: Error?) -> Void)
    typealias UpdateToDoCompletionHandler = ((_ status: Bool? ,_ error: Error?) -> Void)
    typealias DeleteToDoCompletionHandler = ((_ error: Error?) -> Void)
    typealias CreateToDoCompletionHandler = ((_ model: ToDoModel?, _ error: Error?)-> Void)
    
    var apolloClient: ApolloProtocol { get }
    var createDelegate: APIManagerCreateProtocol? { get set }
    
    func getToDoList(then: @escaping GetToDoListCompletionHandler)
    func updateToDo(id: Int, status: Bool, then: @escaping UpdateToDoCompletionHandler)
    func deleteToDo(id: Int, then: @escaping DeleteToDoCompletionHandler)
    func createToDo(title: String, description: String?, then: @escaping CreateToDoCompletionHandler)
}

final class APIManager: APIManagerProtocol, ObservableObject {
    var apolloClient: ApolloProtocol
    weak var createDelegate: APIManagerCreateProtocol?
    static let shared = APIManager()
    
    init() {
        apolloClient = Apollo.shared
    }
    
    func getToDoList(then: @escaping GetToDoListCompletionHandler) {
        let ToDoListQuery = ToDoListQuery()
        apolloClient.client.fetch(query: ToDoListQuery) { result in
            switch result {
            
            case .success(let graphqlResult):
                if let list = graphqlResult.data?.reminders?.compactMap({ item in
                    return ToDoModel(id: item?.id, title: item?.title, description: item?.description, status: item?.status)
                }) {
                    then(list, nil)
                }
            case .failure(let error):
                print(error)
                then(nil, error)
            }
        }
    }
    
    func updateToDo(id: Int, status: Bool, then: @escaping UpdateToDoCompletionHandler) {
        let updateQuery = UpdateMutation(id: id, status: status)
        apolloClient.client.perform(mutation: updateQuery) { result in
            switch result {
            case .success(let response):
                if let updateStatus = response.data?.updateStatus.status {
                    then(updateStatus, nil)
                } else if let error = response.errors?[0] {
                    then(nil, error)
                }
                
            case .failure(let error):
                then(nil, error)
            }
        }
    }
    
    func deleteToDo(id: Int, then: @escaping DeleteToDoCompletionHandler) {
        
    }
    
    func createToDo(title: String, description: String?, then: @escaping CreateToDoCompletionHandler) {
        let createQuery = CreateToDoMutation(title: title, description: description)
        apolloClient.client.perform(mutation: createQuery) { [weak self] result in
            switch result {
            case .success(let response):
                if let responseItem = response.data?.post {
                    // append todoModel to `todoModelList`
                    let dataModel = ToDoModel(id: responseItem.id, title: responseItem.title, description: responseItem.description, status: responseItem.status)
                    self?.createDelegate?.new(item: dataModel)
                } else if let error = response.errors?[0] {
                    then(nil, error)
                }
                
            case .failure(let error):
                then(nil, error)
            }
        }
    }
}
