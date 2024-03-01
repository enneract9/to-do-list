//
//  FileCache.swift
//  project todolist
//
//  Created by @_@ on 14.11.2023.
//

import Foundation

final class FileCache {
    private(set) var items: [TodoItem] = []
    private let fileName = "fileCache"
    
    init() {
        loadFromJSONFile()
    }
    
    func addTodoItem(todoItem: TodoItem) {
        if let index = items.firstIndex(where: { item in item.id == todoItem.id }) {
            items[index] = todoItem
        } else {
            items.append(todoItem)
        }
        
        saveToJSONFile()
    }
    
    func removeTodoItem(id: UUID) -> TodoItem? {
        if let index = items.firstIndex(where: { item in item.id == id }) {
            let removedItem = items.remove(at: index)
            saveToJSONFile()
            return removedItem
        } else {
            return nil
        }
    }
    
    func removeAllTodoItems() {
        items = []
        saveToJSONFile()
    }
    
    // MARK: Working with JSON
    private func loadFromJSONFile() {
        do {
            guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                throw FileCacheErrors.cannotFindSystemDirectory
            }
            let urlToJsonFile = directory.appending(path: "\(fileName).json")
            
            guard FileManager.default.fileExists(atPath: urlToJsonFile.path()) else {
                FileManager.default.createFile(atPath: urlToJsonFile.path(), contents: nil)
                debugPrint("FileManager cannot find json file at path: \(urlToJsonFile.path()). Empty json file had created.")
                return
            }
            
            let data = try Data(contentsOf: urlToJsonFile)
            let decoder = JSONDecoder()
            items = try decoder.decode(TodoItems.self, from: data).todoItems
        } catch {
            debugPrint("Error while loading JSON file: \(String(describing: error)).")
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
            debugPrint("Error while saving to JSON file: \(String(describing: error)).")
        }
        
    }
}

// асинхронность!
// async-await ?
// throws c gcd ?

extension FileCache {
    func addTestTodoItemsToJSON() {
        let items = [
            TodoItem(title: "Usual todo", importance: .usual),
            TodoItem(title: "Long title todo long title todo long title todo long title todo long title todo long title todo long title todo ", importance: .usual),
            TodoItem(title: "Todo with deadline", deadline: Date.now.addingTimeInterval(TimeInterval(integerLiteral: 1000)), importance: .usual),
            TodoItem(title: "Important todo", importance: .important),
            TodoItem(title: "Unimportant todo", importance: .unimportant)
        ]
        
        self.items = items
        
        saveToJSONFile()
    }
}
