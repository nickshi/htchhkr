//
//  AppDelegate.swift
//  htchhkr
//
//  Created by nick.shi on 3/2/18.
//  Copyright © 2018 nick.shi. All rights reserved.
//

import UIKit
import Firebase

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns + column)]
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns + column)] = newValue
        }
    }
}

class Fahrenheit {
    var temperature: Int = 1
   
    
    init(temp: Int) {
        temperature = temp
    }
}
class Vehicle {
    var currentSpeed: Int
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    init() {
        currentSpeed = 0
    }
    func makeNoise() {
        
    }
}

class Train : Vehicle {
    override func makeNoise() {
        super.makeNoise()
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var MenuContainerVC: ContainerVC {
        return containerVC
    }
    fileprivate var containerVC = ContainerVC()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        containerVC = ContainerVC()
        window?.rootViewController = containerVC
        window?.makeKeyAndVisible()
        
        let fa:Fahrenheit = Fahrenheit(temp: 1)
        print(fa.temperature)
        let x = try! someThrowingFunction()
        print(x)
        return true
    }
    func someThrowingFunction() throws -> Int {
        return 1
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    class func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

