//
//  Date+Extensions.swift
//  project todolist
//
//  Created by @_@ on 20.11.2023.
//

import Foundation

private let dateFormatter: DateFormatter = {
     let dateFormatter = DateFormatter()
     dateFormatter.locale = Locale(identifier: "en-US")
     dateFormatter.dateFormat = "dd MMMM yyyy"
    
     return dateFormatter
 }()

private let croppedDateFormatter: DateFormatter = {
     let dateFormatter = DateFormatter()
     dateFormatter.locale = Locale(identifier: "en-US")
     dateFormatter.dateFormat = "dd MMMM"
    
     return dateFormatter
 }()

extension Date {
    var toString: String { dateFormatter.string(from: self) }
}

extension Date {
    var toStringCropped: String { croppedDateFormatter.string(from: self) }
}
