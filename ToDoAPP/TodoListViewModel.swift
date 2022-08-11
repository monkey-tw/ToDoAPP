//
//  TodoListViewModel.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class TodoListViewModel {
    var todoItems: [TodoItem] = []
    var finishedItems: [TodoItem] = []
    
    func save(item: TodoItem) {
        todoItems.insert(item, at: 0)
    }
    
    func check(item: TodoItem) {
        item.isChecked = true
        finishedItems.insert(item, at: 0)
        todoItems = todoItems.filter{ $0 != item }
    }
    
    func uncheck(item: TodoItem) {
        item.isChecked = false
        todoItems.append(item)
        finishedItems = finishedItems.filter{ $0 != item }
    }
    
    func delete(item: TodoItem) {
        if item.isChecked {
            finishedItems = finishedItems.filter{ $0 != item }
        } else {
            todoItems = todoItems.filter{ $0 != item }
        }
    }
    
}
