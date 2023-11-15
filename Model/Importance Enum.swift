//
//  ImportanceEnum.swift
//  project todolist
//
//  Created by @_@ on 12.11.2023.
//

import Foundation

enum Importance: String {
    case usual
    case important
    case unimportant
}

extension Importance: Codable {
    // To conform to Codable , an object needs to declare its properties and their data types, and the Swift compiler generates the necessary encoding and decoding methods automatically
}
