///**
/**
 
 AppDelegate.swift
 Sport B.I.
 
 Created by: Kevin on 05/10/18
 Using Swift 4.0
 Running on macOS 10.14
 
 Copyright (c) 2018 ClubSpeed. All rights reserved.
 
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        Util.prepareApplication()
        
        return true
    }
}

