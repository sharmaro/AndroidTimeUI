//
//  AppDelegate.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = .init(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let vc = SampleUsageVC()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        return true
    }
}
