//
//  AppDelegate.swift
//  star-wars
//
//  Created by Livia Vasconcelos on 04/11/18.
//  Copyright © 2018 Livia Vasconcelos. All rights reserved.
//

import UIKit
import SWHttpTrafficRecorder
import OHHTTPStubs

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if isTestEnvironment() {
            stub(condition: isHost("swapi.co") && isPath("/api/people")) { _ in
                let person1 = ["name": "name 1", "mass": "mass 1", "height": "height 1"]
                let person2 = ["name": "name 2", "mass": "mass 2", "height": "height 2"]
                let person3 = ["name": "name 3", "mass": "mass 3", "height": "height 3"]

                let people = [person1, person2, person3]
            
                let obj = ["count":2, "next":"huaha", "previous": nil, "results": people] as! [String : Any]
                return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
            }
        }
        
        return true
    }
    
    fileprivate func isTestEnvironment() -> Bool {
        let environment = ProcessInfo().environment
        
        if environment["TESTING"] == "YES" {
            return true
        }
        
        return false
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
         OHHTTPStubs.removeAllStubs()
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

