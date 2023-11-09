//
//  AppDelegate.swift
//  ExUITouch
//
//  Created by 김종권 on 2023/11/09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = MyWindow()
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}

class MyWindow: UIWindow {
    open override func sendEvent(_ event: UIEvent) {
        if let allTouches = event.allTouches {
            allTouches.forEach { touch in
                switch touch.phase {
                case .began:
                    print("began")
                case .ended, .cancelled:
                    print("end")
                default:
                    // .moved, .stationary, .regionEntered, .regionMoved, .regionExited
                    break
                }
            }
        }
        
        super.sendEvent(event)
    }
}
