//
//  JMSTabBarController.swift
//  JMSTabBarKit
//
//  Created by shengxiao on 16/2/14.
//  Copyright © 2016年 shengxiao. All rights reserved.
//

import Foundation

public typealias JMTabBarLoginStateControl = (UIViewController) -> Void

private let JMS_Tag_Origin                 = 1000;

public class JMSTabBarController:UITabBarController,UITabBarControllerDelegate {
    // MARK: - Public Properties
    /**
     * 登录状态控制
     */
    public var tabBarLoginStateControl:JMTabBarLoginStateControl?;
    
    /**
     * tabBar数据
     */
    public var tabBarArray:Array<JMSTabBarItem> {
        set {
            _tabBarArray = newValue;
            self.setupTabBarController();
        }
        get {
            return _tabBarArray;
        }
    }
    
    /**
     * tabBar项选中状态下的样式
     */
    public var tabBarSelectedTextAttributesDic:Dictionary<String,AnyObject> {
        set {
            _tabBarSelectedTextAttributesDic = newValue;
            self.setupTabBarController();
        }
        get {
            return _tabBarSelectedTextAttributesDic;
        }
    }
    
    /**
     * tabBar项未选中状态下的样式
     */
    public var tabBarUnSelectedTextAttributesDic:Dictionary<String,AnyObject> {
        set {
            _tabBarUnSelectedTextAttributesDic = newValue;
            self.setupTabBarController();
        }
        get {
            return _tabBarUnSelectedTextAttributesDic;
        }
    }
    
    // MARK: - Private Properties
    private var _tabBarArray:Array<JMSTabBarItem>               = [];
    private var _tabBarSelectedTextAttributesDic:Dictionary<String,AnyObject>;
    private var _tabBarUnSelectedTextAttributesDic:Dictionary<String,AnyObject>;
    private var _loginStateControlArray:Array<UIViewController> = [];
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    // MARK: - Self
    /**
     * 初始化JMSTabBar
     */
    public init(tabBarArray:Array<JMSTabBarItem>,tabBarSelectedTextAttributes:Dictionary<String,AnyObject>,tabBarUnSelectedTextAttributes:Dictionary<String,AnyObject>) {
        _tabBarArray                       = tabBarArray;
        _tabBarSelectedTextAttributesDic   = tabBarSelectedTextAttributes;
        _tabBarUnSelectedTextAttributesDic = tabBarUnSelectedTextAttributes;
        super.init(nibName: nil, bundle: nil);
        self.setupTabBarController();
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func setupTabBarController() {
        if (self.tabBarArray.count != 0) {
            let count = self.tabBarArray.count;
            var viewControllerArray:Array<UIViewController> = [];
            for(var i = 0; i < count; i++) {
                let item = self.tabBarArray[i];
                if item.controllerClass is UIViewController.Type {
                    let viewController             = item.controllerClass as! UIViewController.Type;

                    let navVC                      = UINavigationController.init(rootViewController: viewController.init());
                    navVC.tabBarItem               = UITabBarItem.init(title: item.title, image: UIImage(named: item.unSelectedImageName),tag:JMS_Tag_Origin + i);
                    navVC.tabBarItem.image         = UIImage(named: item.unSelectedImageName);
                    navVC.tabBarItem.selectedImage = UIImage(named: item.selectedImageName);
                    
                    navVC.tabBarItem.selectedImage = navVC.tabBarItem.selectedImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
                    
                    if (item.selected) {
                        navVC.tabBarItem.setTitleTextAttributes(self.tabBarSelectedTextAttributesDic, forState: UIControlState.Normal);
                        self.selectedIndex = i;
                    }else {
                        navVC.tabBarItem.setTitleTextAttributes(self.tabBarUnSelectedTextAttributesDic, forState: UIControlState.Normal);
                    }
                    
                    // 是否检查登录记录
                    if (item.loginStateControl) {
                        _loginStateControlArray.append(navVC);
                    }
                    
                    viewControllerArray.append(navVC);
                }
            }
            
            self.viewControllers = viewControllerArray;
            self.delegate        = self;
        }
    }
    
    // MARK: - UITabBarControllerDelegate
    public func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (_loginStateControlArray.count != 0) {
            if (_loginStateControlArray.contains(viewController)) {
               self.tabBarLoginStateControl?(viewController);
            }
        }
        
        viewController.tabBarItem.setTitleTextAttributes(self.tabBarSelectedTextAttributesDic, forState: UIControlState.Normal);
        for vc in tabBarController.viewControllers! {
            if (vc != viewController) {
                vc.tabBarItem.setTitleTextAttributes(self.tabBarUnSelectedTextAttributesDic, forState: UIControlState.Normal);
            }
        }
        
        return true;
    }
}

