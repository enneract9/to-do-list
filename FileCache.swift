//
//  FileCache.swift
//  project todolist
//
//  Created by @_@ on 14.11.2023.
//

import Foundation

class FileCache {
    private(set) var items: [TodoItem] = []
    private let fileName = "fileCache"
    
    init() {
        loadFromJSONFile()
    }
    
    private func loadFromJSONFile() {
        do {
            guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                throw FileCacheErrors.cannotFindSystemDirectory
            }
            let path = directory.appending(path: "\(fileName).json")
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            items = try decoder.decode(TodoItems.self, from: data).todoItems
        } catch {
            debugPrint("Error while loading JSON file: \(String(describing: error))")
        }
    }
    
    private func saveToJSONFile() {
        do {
            guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                throw FileCacheErrors.cannotFindSystemDirectory
            }
            let path = directory.appending(path: "\(fileName).json")
            let encoder = JSONEncoder()
            let data = try encoder.encode(TodoItems(todoItems: self.items))
            try data.write(to: path)
        } catch {
            debugPrint("Error while saving to JSON file: \(String(describing: error))")
        }
        
    }
    
    func addTodoItem(todoItem: TodoItem) {
        if let index = items.firstIndex(where: { item in item.id == todoItem.id } ) {
            items[index] = todoItem
        } else {
            items.append(todoItem)
        }
        
        saveToJSONFile()
    }
    
    func removeTodoItem(id: UUID) -> TodoItem? {
        if let index = items.firstIndex(where: { item in item.id == id } ) {
            let removedItem = items.remove(at: index)
            saveToJSONFile()
            return removedItem
        } else {
            return nil
        }
    }
    
    
}

// асинхронность!
// async-await ?
// throws c gcd ?
