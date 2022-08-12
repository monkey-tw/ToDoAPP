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
            TodoListView()
        }
    }
}
