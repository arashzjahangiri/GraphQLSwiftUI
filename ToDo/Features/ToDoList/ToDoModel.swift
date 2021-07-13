//
//  ToDoModel.swift
//  ToDo
//
//  Created by Arash Z. Jahangiri on 11.07.21.
//

import Foundation

struct ToDoModel: Decodable, Identifiable, Hashable {
    var id: Int?
    var title: String?
    var description: String?
    var status: Bool?
}
