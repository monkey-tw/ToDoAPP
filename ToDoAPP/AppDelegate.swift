//
//  AppDelegate.swift
//  ToDoAPP
//
//  Created by Jiezhong Wu on 2022/8/12.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if CommandLine.arguments.contains("-disableAnimations") {
            UIView.setAnimationsEnabled(true)
        }
        return true
    }
}
