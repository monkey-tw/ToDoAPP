//
//  TodoItem.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class TodoItem: Equatable, Identifiable, Hashable {
    var id: String
    let title: String
    var isChecked: Bool
    
    init(title: String, id: String = String(Date().timeIntervalSince1970)) {
        self.title = title
        self.id = id
        self.isChecked = false
    }
    
    static func == (lhs: TodoItem, rhs: TodoItem) -> Bool {
        return lhs.title == rhs.title && lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
