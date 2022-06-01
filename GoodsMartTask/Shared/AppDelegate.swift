//
//  AppDelegate.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared().isEnabled = true
        return true
    }

    

}

