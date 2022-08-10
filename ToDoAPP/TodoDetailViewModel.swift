//
//  TodoDetailViewModel.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class TodoDetailViewModel {
    let onCheckClicked: (TodoItem) -> Void
    let onUnCheckClicked: (TodoItem) -> Void
    
    init(
        onCheckClicked: @escaping ((TodoItem) -> Void),
        onUnCheckClicked: @escaping ((TodoItem) -> Void)
    ) {
        self.onCheckClicked = onCheckClicked
        self.onUnCheckClicked = onUnCheckClicked
    }
    
    func check(item: TodoItem) {
        onCheckClicked(item)
    }
    
    func uncheck(item: TodoItem) {
        onUnCheckClicked(item)
    }
}
