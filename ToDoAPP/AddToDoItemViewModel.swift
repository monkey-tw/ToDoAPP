//
//  AddToDoItemViewModel.swift
//  ToDoAPP
//
//  Created by Zishu Ma on 2022/8/10.
//

import Foundation

class AddToDoItemViewModel {
    let onSaveClicked: (TodoItem) -> Void
    
    init(onSaveClicked: @escaping ((TodoItem) -> Void)) {
        self.onSaveClicked = onSaveClicked
    }
    
    func save(item: TodoItem) {
        onSaveClicked(item)
    }
}
