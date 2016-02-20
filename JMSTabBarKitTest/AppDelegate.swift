//
//  AppDelegate.swift
//  JMSTabBarKitTest
//
//  Created by shengxiao on 16/2/14.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import UIKit
import JMSTabBarKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.setupTabBar();
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Private
    func setupTabBar() {
        var tabBarArray:Array<JMSTabBarItem> = [];
        for(var i = 0;i < 4; i++) {
        let item:JMSTabBarItem          = JMSTabBarItem();
        var title                       = "";
            var controllerClass:AnyClass?;
        var selectedImageName           = "";
        var unSelectedImageName         = "";
        var selected                    = false;
        var loginState                  = false;

        if (i == 0) {
            title                       = "首页";
            controllerClass             = FirstViewController.self;
            selectedImageName           = "Tab_Main_Highlight";
            unSelectedImageName         = "Tab_Main_Normal";
            selected                    = true;
        }else if (i == 1) {
            title                       = "客服";
            controllerClass             = SecondViewController.self;
            selectedImageName           = "Tab_Assistant_Highlight";
            unSelectedImageName         = "Tab_Assistant_Normal";
        }else if (i == 2) {
            title                       = "日记";
            controllerClass             = ThirdViewController.self;
            selectedImageName           = "Tab_Diary_Highlight";
            unSelectedImageName         = "Tab_Diary_Normal";
        }else if (i == 3) {
            title                       = "我的";
            controllerClass             = FourthViewController.self;
            selectedImageName           = "Tab_Mine_Highlight";
            unSelectedImageName         = "Tab_Mine_Normal";
            loginState                  = true;
        }
            item.title                  = title;
            item.controllerClass        = controllerClass ;
            item.selectedImageName      = selectedImageName;
            item.unSelectedImageName    = unSelectedImageName;
            item.selected               = selected;
            item.loginStateControl      = loginState;

            tabBarArray.append(item);
        }

        let selectedStyleDic            = [NSFontAttributeName:UIFont.systemFontOfSize(12.0),NSForegroundColorAttributeName:UIColor(colorLiteralRed: 255.0/255.0, green: 73.0/255.0, blue: 0.0/255.0, alpha: 1.0)];
        let unSelectedStyleDic          = [NSFontAttributeName:UIFont.systemFontOfSize(12.0),NSForegroundColorAttributeName:UIColor(colorLiteralRed: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)];

        let tabBar:JMSTabBarController  = JMSTabBarController(tabBarArray: tabBarArray, tabBarSelectedTextAttributes: selectedStyleDic, tabBarUnSelectedTextAttributes: unSelectedStyleDic);

        tabBar.tabBarLoginStateControl  = { (viewController:UIViewController) -> () in
        let loginVC:LoginViewController = LoginViewController();
            viewController.presentViewController(loginVC, animated: true, completion: { () -> Void in

            });
        };
        self.window?.rootViewController = tabBar;
    }
}

