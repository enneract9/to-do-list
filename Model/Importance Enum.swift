//
//  ImportanceEnum.swift
//  project todolist
//
//  Created by @_@ on 12.11.2023.
//

import Foundation
import UIKit

enum Importance: Int {
    case unimportant = 0
    case usual = 1
    case important = 2
    
    var tintColor: UIColor {
        switch self {
        case .important : return .systemRed
        case .usual : return .black
        case .unimportant : return .systemGray3
        }
    }
    
    var image: UIImage? {
        switch self {
        case .important : return UIImage(systemName: "exclamationmark.2")
        case .unimportant : return UIImage(systemName: "arrow.down")
        default : return nil
        }
    }
}

extension Importance: Codable {
    // To conform to Codable , an object needs to declare its properties and their data types, and the Swift compiler generates the necessary encoding and decoding methods automatically
}
