//
//  TodoItem.swift
//  project todolist
//
//  Created by @_@ on 14.11.2023.
//

import Foundation

struct TodoItem: Codable {
    let id: UUID
    var title: String
    var description: String?
    var dateOfCreation: Date
    var deadline: Date?
    var importance: Importance
    var isDone: Bool
    
    init(title: String, description: String? = nil, deadline: Date? = nil, importance: Importance) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.dateOfCreation = Date()
        self.deadline = deadline
        self.importance = importance
        self.isDone = false
    }
}

/*
 struct VS class usage
 https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes
    1) Use structures by default.
    2) Use classes when you need Objective-C interoperability.
    3) Use classes when you need to control the identity of the data you’re modeling.
    4) Use structures along with protocols to adopt behavior by sharing implementations.
 */
