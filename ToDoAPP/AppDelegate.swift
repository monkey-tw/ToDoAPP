//
//  AppDelegate.swift
//  ToDoAPP
//
//  Created by Jiezhong Wu on 2022/8/12.
//

import UIKit
import SwiftUI
import Combine

enum ViewPage: String {
    case TodoListView
    case TodoDetailView
    case AddTodoItemView
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var rootPage: ViewPage = .TodoListView
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if let identifier = ProcessInfo().environment["rootView"],
            let page = ViewPage(rawValue: identifier) {
            rootPage = page
        }
        
        if CommandLine.arguments.contains("-cleanUserDefaults") {
            TodoItemManager().deleteAllItems()
        }
        
        return true
    }
}
