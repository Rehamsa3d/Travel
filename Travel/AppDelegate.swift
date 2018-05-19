//
//  AppDelegate.swift
//  Travel
//
//  Created by ahmedxiio on 4/5/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import DropDown

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DropDown.startListeningToKeyboard()

        return true
    }



}

