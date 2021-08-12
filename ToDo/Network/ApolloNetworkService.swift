//
//  ApolloNetworkService.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 12.08.21.
//

import Apollo

protocol ApolloProtocol {
    var client: ApolloClient { get }
}

final class Apollo: ApolloProtocol {
    static let shared = Apollo()
    let client: ApolloClient
    
    init() {
        client = ApolloClient(url: URL(string: "http://localhost:4000/")!)
    }
}
