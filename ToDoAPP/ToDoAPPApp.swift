//
//  ToDoAPPApp.swift
//  ToDoAPP
//
//  Created by Jiaxin Pu on 2022/8/9.
//

import SwiftUI

@main
struct ToDoAPPApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            switch appDelegate.rootPage {
            case .TodoListView:
                TodoListView(viewModel: .init(todoItemStorable: TodoItemManager()))
            case .TodoDetailView:
                TodoDetailView(viewModel: .init(item: .init(title: "task1"), onCheckClicked: { (_) in }, onUnCheckClicked: { (_) in }))
            case .AddTodoItemView:
                AddTodoItemView(viewModel: .init(onSaveClicked: { (_) in }))
            }
            
        }
    }
}
