//
//  AppDelegate.swift
//  SwiftyDo
//
//  Created by James Williams on 8/7/18.
//  Copyright © 2018 James Williams. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Error installing new realm \(error)")
        }
        
        return true
    }

}

