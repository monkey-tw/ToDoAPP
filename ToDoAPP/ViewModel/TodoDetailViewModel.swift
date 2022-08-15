//
//  TodoDetailViewModel.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class TodoDetailViewModel: ObservableObject {
    let item: TodoItem
    let onCheckClicked: (TodoItem) -> Void
    let onUnCheckClicked: (TodoItem) -> Void
    var title: String{
        item.title
    }
    @Published var isChecked: Bool
    
    init(
        item: TodoItem,
        onCheckClicked: @escaping ((TodoItem) -> Void),
        onUnCheckClicked: @escaping ((TodoItem) -> Void)
    ) {
        self.item = item
        self.isChecked = item.isChecked
        self.onCheckClicked = onCheckClicked
        self.onUnCheckClicked = onUnCheckClicked
    }
    
    func check(item: TodoItem) {
        item.isChecked = true
        isChecked = true
        onCheckClicked(item)
    }
    
    func uncheck(item: TodoItem) {
        item.isChecked = false
        isChecked = false
        onUnCheckClicked(item)
    }
}
