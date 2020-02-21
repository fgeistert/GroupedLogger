//
//  AppDelegate.swift
//  Example
//
//  Created by Fabian Geistert on 3/29/19.
//  Copyright © 2019 PocketSchool. All rights reserved.
//

import UIKit
import GroupedLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // normal print call
        
        print("normal print statement <~ boring")
        
        // direct function calls
        
        log.debug("Test")
        log.info("A")
        log.notice("B")
        log.warning("C")
        log.error("Blup")
        log.critical("D")
        log.alert("E")
        log.emergency("F")
        log.success("Blah")
        
        // change settings
        
        log.setSettings(to: GroupedLogger.Settings(useTimestamp: .yes(dateFormatter: standardDateFormatter)))
        
        // print function calls
        
        log.print("Test3")
        log.print("Test3", group: .network)
        log.print("Test4", logLevel: .emergency, group: .coordinator)
        log.print("Test4", logLevel: .success, group: .sync)
        
        // non emoji
        
        log.setSettings(to: GroupedLogger.Settings(useTimestamp: .no, useEmoji: .no))
        
        log.print("Hello")
        log.print("Hello World", logLevel: .success)
        log.print("Hi", logLevel: .notice, group: .system)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}
