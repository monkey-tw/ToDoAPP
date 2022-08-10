//
//  TodoItem.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class TodoItem: Equatable {
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.title == rhs.title
    }
    
    let title: String
    var isChecked: Bool
    
    init(title: String) {
        self.title = title
        self.isChecked = false
    }
}
