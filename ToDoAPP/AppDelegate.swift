//
//  AppDelegate.swift
//  ToDoAPP
//
//  Created by Jiezhong Wu on 2022/8/12.
//

import UIKit
import SwiftUI

enum ViewPage: String {
    case TodoListView
    case TodoDetailView
}

//@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    var rootPage: ViewPage = .TodoListView
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if CommandLine.arguments.contains("-disableAnimations") {
            UIView.setAnimationsEnabled(true)
        }
        print("arguments: \(CommandLine.arguments)")
        print("environment: \(ProcessInfo().environment)")
//        window = UIWindow(frame: UIScreen.main.bounds)
        if let identifier = ProcessInfo().environment["rootView"],
            let page = ViewPage(rawValue: identifier) {
            rootPage = page
//            switch page {
//            case .TodoDetailView:
//                let view = TodoDetailView(viewModel: TodoDetailViewModel(item: .init(title: "task1"), onCheckClicked: { _ in
//
//                }, onUnCheckClicked: { _ in
//
//                }))
//                window?.rootViewController = RootVC<TodoDetailView>(rootView: view)
//            }
        }
        
        
//        window?.rootViewController = UIHostingController(rootView: view)
//        window?.makeKeyAndVisible()
        return true
    }
}
