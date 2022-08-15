//
//  MockTodoItemManager.swift
//  ToDoAPPTests
//
//  Created by Jiaxin Pu on 2022/8/15.
//

import Foundation
@testable import ToDoAPP

class MockTodoItemManager: TodoItemStorable {
    var callPath: [FuncName] = []
    enum FuncName {
        case save
        case deleteAllItems
        case delete
        case update
        case queryAllItems
    }
    
    func save(_ item: TodoItem) {
        callPath.append(.save)
    }
    
    func deleteAllItems() {
        callPath.append(.deleteAllItems)
    }
    
    func delete(_ item: TodoItem) {
        callPath.append(.delete)
    }
    
    func update(_ item: TodoItem) {
        callPath.append(.update)
    }
    
    func queryAllItems() -> [TodoItem] {
        callPath.append(.queryAllItems)
        return []
    }
}
