//
//  AppDelegate.swift
//  JMSTabBarKitTest
//
//  Created by shengxiao on 16/2/14.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var tabBar:JMSTabBarController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.setupTabBar()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Private
    func setupTabBar() {
        var tabBarArray:Array<JMSTabBarItem> = []
        for i in 0 ..< 3 {
        var title                       = ""
            var controller: UIViewController?
        var selectedImageName           = ""
        var unSelectedImageName         = ""
        var selected                    = false

        if (i == 0) {
            title                       = "主页"
            controller                  = UINavigationController.init(rootViewController: FirstViewController())
            selectedImageName           = "Tab_Main_Selected"
            unSelectedImageName         = "Tab_Main_UnSelected"
            selected                    = true
        }else if (i == 1) {
            title                       = "添加"
            controller                  = SecondViewController()
            selectedImageName           = "Tab_Center_Selected"
            unSelectedImageName         = "Tab_Center_UnSelected"
        }else if (i == 2) {
            title                       = "我的"
            controller                  = ThirdViewController()
            selectedImageName           = "Tab_Mine_Selected"
            unSelectedImageName         = "Tab_Mine_UnSelected"
        }
            
            let item: JMSTabBarItem = JMSTabBarItem.init(tTitle: title, tController: controller!, tSelectedImageName: selectedImageName, tUnSelectedImageName: unSelectedImageName, tSelected: selected)

            tabBarArray.append(item)
        }

        let selectedStyleDic            = [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0),NSForegroundColorAttributeName:UIColor(colorLiteralRed: 0.0/255.0, green: 152.0/255.0, blue: 0.0/255.0, alpha: 1.0)]
        let unSelectedStyleDic          = [NSFontAttributeName:UIFont.systemFont(ofSize: 12.0),NSForegroundColorAttributeName:UIColor(colorLiteralRed: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)]

        self.tabBar  = JMSTabBarController(tabBarArray: tabBarArray, tabBarSelectedTextAttributes: selectedStyleDic, tabBarUnSelectedTextAttributes: unSelectedStyleDic)

        self.tabBar!.tabBarShouldSelectBlock  = { (viewController:UIViewController, shouldSelectedIndex) -> (Bool) in
            if (shouldSelectedIndex == 2) {
                let loginVC:LoginViewController = LoginViewController()
                viewController.present(loginVC, animated: true, completion: { () -> Void in
                    
                })
                
                return false
            }
            
            return true
        }
                
        self.window?.rootViewController = tabBar
    }
    
}

