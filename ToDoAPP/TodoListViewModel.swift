//
//  TodoListViewModel.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var clickedItem: TodoItem?
    @Published var todoItems: [TodoItem] = []
    @Published var finishedItems: [TodoItem] = []
    
    func save(item: TodoItem) {
        todoItems.insert(item, at: 0)
        todoItems = Array(todoItems)
    }
    
    func check(item: TodoItem) {
        item.isChecked = true
        finishedItems.insert(item, at: 0)
        finishedItems = Array(finishedItems)
        todoItems = todoItems.filter{ $0 != item }
    }
    
    func uncheck(item: TodoItem) {
        item.isChecked = false
        todoItems.append(item)
        todoItems = Array(todoItems)
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
