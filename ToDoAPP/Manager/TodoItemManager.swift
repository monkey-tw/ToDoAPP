//
//  ItemManager.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/15.
//

import Foundation

protocol TodoItemStorable {
    func save(_ item: TodoItem)
    func deleteAllItems()
    func delete(_ item: TodoItem)
    func update(_ item: TodoItem)
    func queryAllItems() -> [TodoItem]
}

class TodoItemManager: TodoItemStorable {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    enum Constants {
        static let todoItemsKey: String = "com.ToDoApp.todoItemsKey"
    }
    
    func save(_ item: TodoItem) {
        let array = queryAllItems()
        var filteredArray = array.filter { $0.id != item.id }
        filteredArray.append(item)
        
        replaceItems(filteredArray)
    }
    
    func deleteAllItems() {
        userDefaults.removeObject(forKey: Constants.todoItemsKey)
    }
    
    func delete(_ item: TodoItem) {
        let array = queryAllItems()
        let result = array.filter{ $0 != item }
        
        replaceItems(result)
    }
    
    func update(_ item: TodoItem) {
        let array = queryAllItems()
        guard array.contains(where: { $0.id == item.id }) else {
            return
        }
        var filteredArray = array.filter { $0.id != item.id }
        filteredArray.append(item)
        replaceItems(filteredArray)
    }
    
    func queryAllItems() -> [TodoItem] {
        guard let data = userDefaults.data(forKey: Constants.todoItemsKey),
                let array = try? JSONDecoder().decode([TodoItem].self, from: data) else {
            return []
        }
        return array
    }
    
    private func replaceItems(_ items: [TodoItem]) {
        let data = try? JSONEncoder().encode(items)
        userDefaults.set(data, forKey: Constants.todoItemsKey)
    }
}
