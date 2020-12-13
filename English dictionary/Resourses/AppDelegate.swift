//
//  AppDelegate.swift
//  slavNeft
//
//  Created by Александр Нейфельд on 19.06.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import UIKit

var appDelegateShared: AppDelegate {
    return UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
}



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var CDManager = CoreDataManager.shared
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CDManager.initialize()
		
        if AllThemes.count != Word.findAll().count {
            Theme.findCreate(jsonArray: AllThemes.jsonAllContent)
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication){
        CDManager.saveContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        CDManager.saveContext()
    }

}




